class Game < ApplicationRecord
    has_many :bags

    validates :name, presence: true
    validates :players_min, presence: true
    validates :duration, presence: true

    def bags_count
        bags.count
    end
end
