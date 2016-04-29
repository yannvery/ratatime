class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :projects, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.uuid :user_id
      t.timestamps
    end
  end
end
