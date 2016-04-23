class ChangeDurationToString < ActiveRecord::Migration[5.0]
  def change
    change_column :trackers, :duration, :string
  end
end
