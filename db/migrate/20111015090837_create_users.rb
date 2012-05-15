class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	t.string :name
	t.string :occupation
	t.string :gender
	t.integer :age
	t.string :email
	t.string :mobile
	t.string :address
	t.string :username
	t.string :password
	t.string :file_upload
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
