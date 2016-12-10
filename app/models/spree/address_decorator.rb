Spree::Address.class_eval do 
  _validators.reject!{ |key, _| [:firstname, :lastname, :address1, :city].include?(key) }
  _validate_callbacks.each do |callback|
    callback.raw_filter.attributes.reject! { |key| [:firstname, :lastname, :address1, :city].include? key } if callback.raw_filter.is_a?(ActiveModel::Validations::PresenceValidator)
  end

  with_options presence: true do
    validates :firstname, :lastname, :address1, :city, if: :require_address?
  end

  attr_accessor :require_address, :require_phone, :require_zipcode

  def require_address?
    @require_address.nil? ? true : @require_address
  end

  def require_phone?
    @require_phone.nil? ? true : @require_zipcode
  end

  def require_zipcode?
    @require_zipcode.nil? ? true : @require_zipcode
  end
end