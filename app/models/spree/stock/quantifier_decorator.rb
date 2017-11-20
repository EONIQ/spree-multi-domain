Spree::Stock::Quantifier.class_eval do 
  def initialize(variant, store)
    @variant = variant
    @stock_items = @variant.stock_items.by_store(store.id).with_active_stock_location
  end
end