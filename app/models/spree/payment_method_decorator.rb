Spree::PaymentMethod.class_eval do
  has_many :store_payment_methods
  has_many :stores, through: :store_payment_methods

  scope :by_store, -> (store_id) do 
    eager_load(:store_payment_methods).where('spree_store_payment_methods.store_id = ?', store_id)
  end
end
