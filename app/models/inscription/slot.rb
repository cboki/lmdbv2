module Inscription
    class Slot
        attr_reader :start_time
        attr_accessor :availability
      
        def initialize(game, start_time)
          @start_time = start_time
          @game = game
        end
      
        def hour
          @start_time.strftime("%k:%M")
        end
      
        def free?(nb_players)
          @availability >= Bag.needed(@game, nb_players)
        end
    end
end
