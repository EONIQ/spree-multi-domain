Spree::Shipment.class_eval do 
  before_validation :assign_store_addresses

  def assign_store_addresses
    if order.store && !order.store.require_address?
      self.address ||= Spree::Address.new
      self.address.attributes = {require_address: order.store.require_address?,
          require_zipcode: order.store.require_address?,
          require_phone: order.store.require_address?}

      self.address.country = order.store.country if address.country.nil?
      self.address.state = order.store.state if address.state.nil?
    end
  end
end