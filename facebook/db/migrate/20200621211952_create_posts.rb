class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text    :content
      t.integer :likes

      t.timestamps
    end
  end
end
