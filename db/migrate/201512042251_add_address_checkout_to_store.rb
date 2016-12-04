class AddAddressCheckoutToStore < ActiveRecord::Migration
  def change
    add_column :spree_stores, :checkout_with_address, :boolean, default: true
  end
end
