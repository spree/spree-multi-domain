module Spree
  module StorePaymentMethodDecorator
    def self.prepended(base)
      base.belongs_to :store
      base.belongs_to :payment_method
    end
  end
end

::Spree::StorePaymentMethod.prepend ::Spree::StorePaymentMethodDecorator
