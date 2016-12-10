Spree::StockItem.class_eval do
  scope :by_store, -> (store) { where(stock_location: store.stock_locations.map(&:id)) }
end