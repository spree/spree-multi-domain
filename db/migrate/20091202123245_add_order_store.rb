require 'spree/multi_domain/migration'

class AddOrderStore < Spree::MultiDomain::Migration

  def self.table
    select_table(:spree, :orders)
  end

  def self.up
    add_column( table, :store_id, :integer ) unless column_exists?( table, :store_id )
  end

  def self.down
    remove_column( table, :store_id ) if column_exists?( table, :store_id )
  end

end
