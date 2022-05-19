module Inscription
    class BookingContact
        include ActiveModel::Model
        attr_accessor :email, :telephone
        validates :email, presence: true
        validates :telephone, presence: true
    end
end