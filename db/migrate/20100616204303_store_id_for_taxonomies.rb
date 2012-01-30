require 'spree/multi_domain/migration'

class StoreIdForTaxonomies < Spree::MultiDomain::Migration

  def self.table
    select_table(:spree, :taxonomies)
  end

  def self.up
    unless column_exists?( table, :store_id )
      add_column( table, :store_id, :integer )
      add_index table, :store_id
    end
  end

  def self.down
    remove_column( table, :store_id ) if column_exists?( table, :store_id )
  end

end
