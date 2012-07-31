class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :spree_stores do |t|
      t.string :name
      t.string :code
      t.text :domains
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_stores
  end
end
