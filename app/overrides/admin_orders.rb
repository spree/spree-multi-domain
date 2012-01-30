Deface::Override.new(
  :virtual_path => "spree/admin/orders/index",
  :name => "multi_domain_admin_orders_index_headers",
  :insert_top => "[data-hook='admin_orders_index_headers']",
  :partial => "spree/admin/orders/index_headers",
  :disabled => false)
Deface::Override.new(
  :virtual_path => "spree/admin/orders/index",
  :name => "multi_domain_admin_orders_index_rows",
  :insert_top => "[data-hook='admin_orders_index_rows']",
  :partial => "spree/admin/orders/index_rows",
  :disabled => false)
Deface::Override.new(
  :virtual_path => "spree/admin/orders/_form",
  :name => "multi_domain_admin_orders_edit_tab",
  :insert_before => "[data-hook='admin_order_form_buttons']",
  :partial => "spree/admin/orders/edit_tab",
  :disabled => false)
  

