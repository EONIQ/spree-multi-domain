Spree::OrdersController.class_eval do 
  before_action :load_stock_locations, only: [:index] 

  def load_stock_locations 
  end
end