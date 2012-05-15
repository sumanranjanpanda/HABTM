class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
	t.references :user
	t.string :album_name
	t.string :album_description
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
