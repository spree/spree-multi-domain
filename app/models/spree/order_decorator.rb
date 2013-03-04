Spree::Order.class_eval do
  belongs_to :store
  scope :by_store, lambda { |store| where(:store_id => store.id) }

  def available_payment_methods
    @available_payment_methods ||= Spree::PaymentMethod.available(nil, store)
  end
end
