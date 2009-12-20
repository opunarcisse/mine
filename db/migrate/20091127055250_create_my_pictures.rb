class CreateMyPictures < ActiveRecord::Migration
  def self.up
    create_table :my_pictures do |t|
      t.string :img_name
      t.string :img_type
      t.integer :img_size
      t.timestamps
    end
  end
  
  def self.down
    drop_table :my_pictures
  end
end
