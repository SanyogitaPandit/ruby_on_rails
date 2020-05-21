class Flight < ApplicationRecord
    belongs_to :from_airport, class_name: 'Airport'
    belongs_to :to_airport, class_name: 'Airport'
    
    has_many :bookings
    has_many :passangers, through: :bookings

    def self.search(params)
        if params[:from_airport] &&
           params[:to_airport]
          Flight.where(from_airport_id: params[:from_airport], to_airport_id: params[:to_airport])
        else
          Flight.all
        end
    end
end
