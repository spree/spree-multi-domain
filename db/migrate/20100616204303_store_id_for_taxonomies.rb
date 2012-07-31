class StoreIdForTaxonomies < ActiveRecord::Migration
  def self.up
    add_column :spree_taxonomies, :spree_store_id, :integer
    add_index  :spree_taxonomies, :spree_store_id
  end

  def self.down
    remove_column :spree_taxonomies, :spree_store_id
  end
end
