class AddToUsers < ActiveRecord::Migration
  def self.up
 add_column :users, :firstname, :string
 add_column :users, :lastname, :string  
 add_column :users, :repassword, :string
  end

  def self.down
  end
end
