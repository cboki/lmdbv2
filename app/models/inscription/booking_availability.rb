module Inscription
    class BookingAvailability
        def initialize(game, date, nb_players)
            @game = game
            @datetime = date.to_datetime
            @nb_players = nb_players
            @slots = []
            @bookings = []
          end
        
          # store the number of bags availables for a given game
          def bags_count
            @bags_count = @game.bags_count
          end
        
          # return an array of object for each playing slot
          def all_day_slots
            (10..18).each do |hour|
              @slots << Slot.new(@game, @datetime.in_time_zone('Paris').change(hour: hour))
            end
          end
        
          # fetch all the bookings of the week with the number of bags for each
          def all_bookings_with_bags
            @bookings = Booking.eager_load(:bags).where(start_time: @datetime.all_day, game: @game)
          end
        
          # return true if the slot is already booked
          def slot_already_booked?(slot)
            @bookings.any? do |bkg|
              bkg.start_time == slot.start_time
            end
          end

          def slot_already_passed_or_too_close?(slot)
            slot.start_time.in_time_zone("Paris").before?(DateTime.current + 2.hours)       
          end
        
          # fetch all the bookings overlaping a given slot
          def bookings_at_the_same_time(slot)
            @bookings.select do |bkg|
              (bkg.start_time..bkg.start_time + @game.duration.minutes).overlaps?(slot.start_time..slot.start_time + @game.duration.minutes)
            end
          end
        
          # return the number of bags already booked at a given time
          def booked_bags(slot)
            bookings_at_the_same_time(slot).sum { |bkg| bkg.bags.size }
          end
        
          # return an array of the number of free bags for each slot
          def availability_map
            @slots.map do |slot|
              slot.availability =
                if slot_already_passed_or_too_close?(slot)
                  0
                elsif !@game.simultaneous_start && slot_already_booked?(slot)
                  0
                elsif bookings_at_the_same_time(slot).any?
                  @bags_count - booked_bags(slot)
                else
                  @bags_count
                end
            end
          end
        
          def process
            bags_count
            all_day_slots
            all_bookings_with_bags
            availability_map
            @slots
          end
    end
end