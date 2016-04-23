class AddLoggedDateToTrackers < ActiveRecord::Migration[5.0]
  def change
    add_column :trackers, :logged_date, :date
  end
end
