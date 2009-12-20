class AddToUseers < ActiveRecord::Migration
  def self.up
    add_column :users, :address, :string  
    add_column :users, :phone, :string
  end

  def self.down
  end
end
