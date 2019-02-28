class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :title
      t.boolean :downloaded

      t.timestamps
    end
  end
end
