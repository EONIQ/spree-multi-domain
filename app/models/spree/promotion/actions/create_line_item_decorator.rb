Spree::Promotion::Actions::CreateLineItems.class_eval do 
  # Checks that there's enough stock to add the line item to the order
  def item_available?(item)
    quantifier = Spree::Stock::Quantifier.new(item.variant, item.store)
    quantifier.can_supply? item.quantity
  end
end