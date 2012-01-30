module Spree
  module Core
    CurrentOrder.module_eval do
      def current_order_with_multi_domain(create_order_if_necessary = false)
        current_order_without_multi_domain(create_order_if_necessary)
        if @current_order and current_store and @current_order.store.nil?
          @current_order.update_attribute(:store_id, current_store.id)
        end
        @current_order
      end
      alias_method_chain :current_order, :multi_domain
    end
  end
end
