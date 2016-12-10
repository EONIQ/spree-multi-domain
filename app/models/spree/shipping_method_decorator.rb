Spree::ShippingMethod.class_eval do
  has_many :store_shipping_methods
  has_many :stores, through: :store_shipping_methods
  
  # This adds store_match to the list of requirements.
  # This will need to be fixed for Spree 2.0 when split shipments is added
  def available_to_order?(order, display_on= nil)
    available_to_display(display_on) && 
    include?(order.ship_address) &&
    store_match?(order)
  end

  def store_match?(order)
    order.store.shipping_methods.empty? || stores.include?(order.store)
  end
end
