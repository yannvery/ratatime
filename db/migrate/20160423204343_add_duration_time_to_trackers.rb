class AddDurationTimeToTrackers < ActiveRecord::Migration[5.0]
  def change
    add_column :trackers, :duration_time, :integer, null: false
  end
end
