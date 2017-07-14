Spree::Admin::OrdersController.class_eval do 
  before_action :load_stock_locations, only: [:index] 

  def load_stock_locations 
  end

  def update_store
    @order = Spree::Order.friendly.find(params[:id])
    authorize! action, @order

    flash[:success] = Spree.t(:order_updated) if @order.update(params.permit(:store_id))
    redirect_to edit_admin_order_url(@order)
  end
end