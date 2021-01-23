module Spree
  module Admin
    module ProductsControllerDecorator
      def self.prepended(base)
        base.before_action :load_stores, only: [:edit, :update]
      end

      private

      def load_stores
        @stores = Spree::Store.pluck(:name, :id)
      end
    end
  end
end

::Spree::Admin::ProductsController.prepend(Spree::Admin::ProductsControllerDecorator)
