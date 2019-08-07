class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :band_id, null: false
      t.boolean :record_type, default: false

      t.timestamps
    end

    add_index :albums, :title
    add_index :albums, [:title, :band_id], unique: true
  end
end
