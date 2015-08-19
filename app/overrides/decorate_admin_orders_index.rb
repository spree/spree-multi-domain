

Deface::Override.new(
    :virtual_path => "spree/admin/orders/index",
    :name => "add_filter_for_store_to_order_index",
    :insert_before => "[data-hook='admin_orders_index_search_buttons']",
    :partial => "spree/admin/orders/store_filter",
    :disabled => false)