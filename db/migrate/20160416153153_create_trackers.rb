class CreateTrackers < ActiveRecord::Migration[5.0]
  def change
    create_table :trackers do |t|
      t.integer :duration, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
