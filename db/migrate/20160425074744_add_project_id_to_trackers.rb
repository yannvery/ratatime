class AddProjectIdToTrackers < ActiveRecord::Migration[5.0]
  def change
    add_reference :trackers, :project, type: :uuid, foreign_key: true
  end
end
