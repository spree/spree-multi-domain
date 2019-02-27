class CreateSpreeTaxonomiesStores < ActiveRecord::Migration
  def self.up
    create_table :spree_taxonomies_stores, :id => false do |t|
      t.references :taxonomy
      t.references :store
      t.timestamps null: false
    end
    add_index :spree_taxonomies_stores, :taxonomy_id
    add_index :spree_taxonomies_stores, :store_id
  end

  def self.down
    drop_table :spree_taxonomies_stores
  end

end
