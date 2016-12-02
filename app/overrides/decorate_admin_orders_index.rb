Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_headers",
  insert_before: "[data-hook='admin_orders_index_header_actions']",
  partial: "spree/admin/orders/index_headers",
  disabled: false)

Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_rows",
  insert_before: "[data-hook='admin_orders_index_row_actions']",
  partial: "spree/admin/orders/index_rows",
  disabled: false)

Deface::Override.new(
  virtual_path: "spree/admin/orders/index",
  name: "multi_domain_admin_orders_index_search",
  #insert_before: "[data-hook='admin_orders_index_search'] :first",
  insert_after: "erb[loud]:contains('search_form_for')",
  partial: "spree/admin/orders/index_search_fields",
  disabled: false)

# Deface::Override.new(
#   virtual_path: "spree/admin/orders/index",
#   name: "multi_domain_admin_orders_index_search",
#   :insert_before => "[data-hook='admin_orders_index_search']",
#   partial: "spree/admin/orders/index_search_fields",
#   disabled: false)

