module Inscription
    class SlotsController < ApplicationController
        skip_before_action :authenticate_user!, only: [ :availabilities ]

        def availabilities
            authorize Slot
            @game = Game.find(session[:booking_info]['game'])
            @nb_players = session[:booking_info]['nb_players']
            @start_date = params.fetch(:start_date, session[:booking_info]['date'])
            @slots = BookingAvailability.new(@game, @start_date.to_date, @nb_players).process
            params[:start_date] = @start_date
        end
    end
end