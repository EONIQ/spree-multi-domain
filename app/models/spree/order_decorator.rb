Spree::Order.class_eval do
  belongs_to :store
  scope :by_store, -> (store) { where(store_id: store) }

  def available_payment_methods
    @available_payment_methods ||= Spree::PaymentMethod.available(:front_end, store)
  end

  checkout_flow do
    go_to_state :address, if: ->{ current_store.checkout_with_address? }
    go_to_state :delivery
    go_to_state :payment, if: ->(order) { order.payment_required? }
    go_to_state :confirm, if: ->(order) { order.confirmation_required? }
    go_to_state :complete
    remove_transition from: :delivery, to: :confirm
  end
end
