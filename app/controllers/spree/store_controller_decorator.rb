Spree::StoreController.class_eval do 
  before_filter :update_current_order_store

  def update_current_order_store
    if current_order && current_order.store != current_store
      current_order.store = current_store
      current_order.save!
      
      current_order.restart_checkout_flow
    end
  end
end