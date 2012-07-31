class RemoveDatetimeColumnsFromProductsStores < ActiveRecord::Migration
  def self.up
    change_table :spree_products_stores do |t|
      t.remove :created_at, :updated_at
    end
  end

  def self.down
    change_table :spree_products_stores do |t|
      t.timestamps
    end
  end
end
