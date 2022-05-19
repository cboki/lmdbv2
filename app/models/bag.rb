class Bag < ApplicationRecord
  belongs_to :game
  has_many :matches
  has_many :bookings, through: :matches

  validates :color, presence: true

  def self.needed(game, nb_players)
    if nb_players < game.players_min
      raise "Il n'est pas possible de jouer avec une si petite équipe..."
    else
      (1..29).to_a.map { |x| (x / 6) + 1 }[nb_players - 2]
    end
  end
end
