Spree::Core::ControllerHelpers::Order.class_eval do
  def current_currency
    # When using spree_multi_currency the current_currency is stored within session[:currency]
    currency = session[:currency] if session.key?(:currency) && supported_currencies.map(&:iso_code).include?(session[:currency])
    # If there is no session currency fall back to the store default
    currency ||= current_store.try(:default_currency)
    # If there is still no currency fall back to Spree default
    currency = Spree::Config[:currency] if currency.blank?
    currency
  end

  def find_order_by_token_or_user(options={}, with_adjustments = false)
    options[:lock] ||= false

    # Find any incomplete orders for the guest_token
    incomplete_orders = Spree::Order.incomplete.by_store(Spree::Store.current_store).includes(line_items: [variant: [:images, :option_values, :product]])
    guest_token_order_params = current_order_params.except(:user_id)
    order = if with_adjustments
              incomplete_orders.includes(:adjustments).lock(options[:lock]).find_by(guest_token_order_params)
            else
              incomplete_orders.lock(options[:lock]).find_by(guest_token_order_params)
            end

    # Find any incomplete orders for the current user
    if order.nil? && try_spree_current_user
      order = last_incomplete_order
    end

    order
  end
end
