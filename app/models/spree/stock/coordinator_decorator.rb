Spree::Stock::Coordinator.class_eval do 
  def stock_locations_with_requested_variants
    Spree::StockLocation.active.joins(:stock_items).
      where({spree_stock_items: { variant_id: requested_variant_ids }, id: @order.store.stock_locations.map(&:id)})
  end
end