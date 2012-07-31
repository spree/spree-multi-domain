class AddStoreToTracker < ActiveRecord::Migration
  def self.up
    change_table :spree_trackers do |t|
      t.references :spree_store
    end 
  end

  def self.down
    change_table :spree_trackers do |t|
      t.remove :spree_store_id
    end
  end
end
