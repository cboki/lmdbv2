module Inscription
    class BookingContactsController < ApplicationController
        skip_before_action :authenticate_user!, only: [ :new, :create ]
        
        def new
            @game = Game.find(session[:booking_info]['game'])
            @nb_players = session[:booking_info]['nb_players']

            session[:booking_info]['start_time'] = params[:start_time]
            @start_time = { day: DateTime.parse(session[:booking_info]['start_time']).strftime("%d/%m/%Y"),
                            hour: DateTime.parse(session[:booking_info]['start_time']).strftime("%Hh%M") }
            @contact = BookingContact.new
            authorize @contact
        end

        def create
            @contact = BookingContact.new(booking_contact_params)
            authorize @contact

            if @contact.valid?
                booking = Booking.new(start_time: DateTime.parse(session[:booking_info]['start_time']), nb_players: session[:booking_info]['nb_players'])
                booking.contact = Contact.create!(booking_contact_params)
                booking.game = Game.find(session[:booking_info]['game'])
                booking.save!

                session.delete(:booking_info)

                redirect_to root_path
            else
                render :new
            end
        end

        private

        def booking_contact_params
            params.require(:inscription_booking_contact).permit(:email, :telephone)
        end
    end
end