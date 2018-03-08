Spree::Variant.class_eval do
  def quantifier
    Spree::Stock::Quantifier.new(self, Spree::Store.current_store)
  end

  def in_stock_cache_key
    "variant-#{Spree::Store.current_store.try(:id)}-#{id}-in_stock"
  end
end