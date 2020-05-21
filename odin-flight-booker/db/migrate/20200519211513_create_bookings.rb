class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer   :flight_id
      t.integer   :passanger_id

      t.timestamps
    end
  end
end
