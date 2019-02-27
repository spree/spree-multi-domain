Deface::Override.new(
  virtual_path: "spree/admin/shared/_order_summary",
  name: "multi_domain_order_summary",
  #insert_before: "[data-hook='admin_orders_index_search'] :first",
  insert_top: "table#order_tab_summary tbody",
  partial: "spree/admin/orders/summary_store_row",
  disabled: false)
