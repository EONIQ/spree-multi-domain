Spree::StoreController.class_eval do 
  before_filter :update_current_order_store, only: [:update, :populate]

  def update_current_order_store
    if current_order && current_order.store_id != current_store.id
      current_order.store_id = current_store.id
      current_order.save!
      
      current_order.restart_checkout_flow
    end
  end
end