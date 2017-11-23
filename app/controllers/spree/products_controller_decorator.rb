Spree::ProductsController.class_eval do

  before_action :can_show_product, only: :show

  private

  def can_show_product
    @product ||= Spree::Product.friendly.find(params[:id])
    if @product.stores.empty? || !@product.stores.flat_map(&:id).include?(current_store.id)
      raise ActiveRecord::RecordNotFound
    end
  end
end
