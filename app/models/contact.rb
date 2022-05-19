class Contact < ApplicationRecord
    has_many :bookings

    validates :email, presence: true
    validates :telephone, presence: true
end
