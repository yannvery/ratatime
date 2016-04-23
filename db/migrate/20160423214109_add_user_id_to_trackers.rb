class AddUserIdToTrackers < ActiveRecord::Migration[5.0]
  def change
    add_column :trackers, :user_id, :uuid
  end
end
