class Booking < ApplicationRecord
    belongs_to  :passanger
    belongs_to  :flight
end
