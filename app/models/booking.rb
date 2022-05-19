class Booking < ApplicationRecord
  belongs_to :contact
  belongs_to :game
  has_many :matches
  has_many :bags, through: :matches

  validates :start_time, presence: true
  validates :nb_players, presence: true
end
