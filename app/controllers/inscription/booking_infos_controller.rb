module Inscription
    class BookingInfosController < ApplicationController
        skip_before_action :authenticate_user!, only: [ :new, :create ]

        def new
            @games = Game.all
            @info = BookingInfo.new
            authorize @info
        end

        def create
            params = { 
                game: booking_info_params['game'].to_i,
                date: Date.new(booking_info_params['date(1i)'].to_i, booking_info_params['date(2i)'].to_i, booking_info_params['date(3i)'].to_i).to_s,
                nb_players: booking_info_params['nb_players'].to_i
            }

            @info = BookingInfo.new(params)
            authorize @info

            if @info.valid?
                session[:booking_info] = {
                    game: @info.game,
                    date: @info.date,
                    nb_players: @info.nb_players
                }

                redirect_to inscription_availabilities_path
            else
                render :new
            end
        end

        private

        def booking_info_params
            params.require(:inscription_booking_info).permit(:game, :date, :nb_players)
        end
    end
end