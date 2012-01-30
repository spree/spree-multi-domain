require 'spree/multi_domain/migration'

class NamespaceMultiDomain < Spree::MultiDomain::Migration

  def change
    rename_table( :stores,              :spree_stores ) if table_exists?( :stores )
    rename_table( :products_stores,      :spree_products_stores ) if table_exists?( :products_stores )
  end

end
