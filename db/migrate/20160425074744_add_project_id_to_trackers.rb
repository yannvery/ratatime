class AddProjectIdToTrackers < ActiveRecord::Migration[5.0]
  def change
    add_column :trackers, :project_id, :uuid
  end
end
