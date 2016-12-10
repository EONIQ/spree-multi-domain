Spree::Stock::Estimator.class_eval do 
  def shipping_methods(package, display_filter)
    package.shipping_methods.select do |ship_method|
      calculator = ship_method.calculator

      ship_method.available_to_order?(order, display_filter) &&
      calculator.available?(package) &&
      (calculator.preferences[:currency].blank? ||
       calculator.preferences[:currency] == currency)
    end
  end
end