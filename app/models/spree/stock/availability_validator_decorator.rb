Spree::Stock::AvailabilityValidator.class_eval do
  def item_available?(line_item, quantity)
    Stock::Quantifier.new(line_item.variant, line_item.store).can_supply?(quantity)
  end
end
