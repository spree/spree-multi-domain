require 'spree/multi_domain/migration'

class AddStoreToTracker < Spree::MultiDomain::Migration

  def self.table
    select_table(:spree, :trackers)
  end

  def self.up
    add_column( table, :store_id, :integer ) unless column_exists?( table, :store_id )
  end

  def self.down
    remove_column( table, :store_id ) if column_exists?( table, :store_id )
  end

end
