class AddOrderStore < ActiveRecord::Migration
  def self.up
    add_column :spree_orders, :spree_store_id, :integer
  end

  def self.down
    remove_column :spree_orders, :spree_store_id
  end
end
