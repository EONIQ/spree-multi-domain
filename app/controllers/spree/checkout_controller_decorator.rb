Spree::CheckoutController.class_eval do 
  before_action :update_current_order_store, only: [:update]
end