Spree::Order.class_eval do
  belongs_to :store
  scope :by_store, -> (store) { where(store_id: store) }

  def available_payment_methods
    @available_payment_methods ||= Spree::PaymentMethod.available(:front_end, store)
  end

  before_validation :assign_store_addresses
  after_initialize :assign_store_addresses
  set_callback :updating_from_params, :after, :assign_store_addresses

  def assign_store_addresses
    assign_default_address_by_store(:bill_address) if store
    assign_default_address_by_store(:ship_address) if store && checkout_steps.include?("delivery")
  end

  def assign_default_address_by_store(address)
    if store && !store.require_address?
      address_variable = self.send(address)
      address_variable ||= Spree::Address.new
      address_variable.attributes = {require_address: store.require_address?,
          require_zipcode: store.require_address?,
          require_phone: store.require_address?}

      address_variable.country = store.country if address_variable.country.nil?
      address_variable.state = store.state if address_variable.state.nil?
      self.send("#{address}=", address_variable)
    end
  end
end