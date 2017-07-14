Deface::Override.new(
  virtual_path: "spree/admin/orders/edit",
  name: "multi_domain_admin_order_store_form",
  insert_before: "div[data-hook='admin_order_edit_header']",
  partial: "spree/admin/orders/store_form",
  disabled: false)
