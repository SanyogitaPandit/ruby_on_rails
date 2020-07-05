class AddForiegnKeyToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :user_id, :integer
    add_column :notifications, :friendship_id, :integer
  end
end
