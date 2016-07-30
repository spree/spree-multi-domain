Deface::Override.new(
  virtual_path: "spree/admin/products/_form",
  name: "multi_domain_admin_product_form_meta",
   :original => '2724f51d519589f73401abeae8f8e05d9dae99c4',
  insert_bottom: "[data-hook='admin_product_form_meta']",
  partial: "spree/admin/products/stores",
  disabled: false)
