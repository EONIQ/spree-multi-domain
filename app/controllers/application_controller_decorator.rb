ApplicationController.class_eval do 
  around_action :set_current_store

  def set_current_store
    Spree::Store.current_store = current_store
    begin
      yield
    ensure
      Spree::Store.current_store = nil
    end
  end
end