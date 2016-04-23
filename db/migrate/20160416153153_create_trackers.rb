class CreateTrackers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :trackers, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.integer :duration, null: false
      t.string  :description, null: false

      t.timestamps
    end
  end
end
