class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :bucket_name
      t.string :bucket_region
      t.string :identity_pool_id
      t.string :album_path
      t.integer :team_id

      t.timestamps
    end
  end
end
