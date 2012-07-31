class AddIndexesToProductsStores < ActiveRecord::Migration
  def self.up
    add_index :spree_products_stores, :spree_product_id
    add_index :spree_products_stores, :spree_store_id
  end

  def self.down
    remove_index :spree_products_stores, :spree_product_id
    remove_index :spree_products_stores, :spree_store_id
  end
end
