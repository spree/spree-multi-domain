module Spree
  module StoreShippingMethodDecorator
    def self.prepended(base)
      base.belongs_to :store
      base.belongs_to :shipping_method
    end
  end
end

::Spree::StoreShippingMethod.prepend ::Spree::StoreShippingMethodDecorator
