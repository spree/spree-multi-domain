class AddDefaultStore < ActiveRecord::Migration
  def self.up
    add_column :spree_stores, :default, :boolean, :default => false
  end

  def self.down
    remove_column :spree_stores, :default
  end
end
