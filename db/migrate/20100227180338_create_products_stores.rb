class CreateProductsStores < ActiveRecord::Migration
  def self.up
    create_table :spree_products_stores, :id => false do |t|
      t.references :spree_product
      t.references :spree_store
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_products_stores
  end
end