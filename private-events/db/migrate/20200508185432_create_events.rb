class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string      :title, null: false, default: "Event"
      t.datetime    :dnt, null: false, default: ""
      t.text        :addr, null: false, default: ""

      t.timestamps
    end
  end
end
