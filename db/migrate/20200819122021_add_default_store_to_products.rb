class AddDefaultStoreToProducts < SpreeExtension::Migration[4.2]
  def self.up
    default_store_id = Spree::Store.default.id
    prepared_values = Spree::Product.with_deleted.order(:id).ids.map { |id| "(#{id}, #{default_store_id})" }.join(', ')
    return if prepared_values.empty?

    execute 'TRUNCATE TABLE spree_products_stores;'
    execute "INSERT INTO spree_products_stores (product_id, store_id) VALUES #{prepared_values};"
  end
end
