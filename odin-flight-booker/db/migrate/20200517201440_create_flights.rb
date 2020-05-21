class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer   :from_airport_id
      t.integer   :to_airport_id
      t.datetime  :sdt, null: false, default: Time.now
      t.integer   :duration, null: false, default: 360

      t.timestamps
    end
  end
end
