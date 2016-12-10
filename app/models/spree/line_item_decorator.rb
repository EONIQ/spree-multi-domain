Spree::LineItem.class_eval do
  delegate :store, to: :order
  
  def sufficient_stock?
    Stock::Quantifier.new(variant, store).can_supply? quantity
  end
end