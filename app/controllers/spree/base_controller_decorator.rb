Spree::BaseController.class_eval do 
  before_filter :set_current_store

  def set_current_store
    Spree::Store.current_store = current_store
  end
end