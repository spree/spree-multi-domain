Spree::Taxonomy.class_eval do
  has_and_belongs_to_many :stores, join_table: 'spree_taxonomies_stores'
  scope :by_store, -> (store) { joins(:stores).where(spree_taxonomies_stores: { store_id: store }) }
end
