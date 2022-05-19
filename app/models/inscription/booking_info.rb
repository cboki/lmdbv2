module Inscription
    class BookingInfo
        include ActiveModel::Model
        attr_accessor :game, :nb_players, :date
        validates :game, presence: true
        validates :nb_players, presence: true
        validates :date, presence: true
    end
end