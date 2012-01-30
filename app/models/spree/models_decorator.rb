module Spree
  Product.class_eval do
    has_and_belongs_to_many :stores, :join_table => 'spree_products_stores'
    scope :by_store, lambda {|store| joins(:stores).where("spree_products_stores.store_id = ?", store)}
  end

  Order.class_eval do
    belongs_to :store
    attr_accessible :store_id
    scope :by_store, lambda { |store| where(:store_id => store.id) }
  end

  Taxonomy.class_eval do
    belongs_to :store
  end

  Tracker.class_eval do
    belongs_to :store

    def self.current(domain)
      trackers = all(:conditions => { :active => true, :environment => Rails.env })
      trackers.select { |t| t.store_id == Store.current(domain).try(:id) }.first if trackers
    end
  end
end
