class AddDefaultAddressToStore < ActiveRecord::Migration
  def change
    rename_column :spree_stores, :checkout_with_address, :checkout_with_shipping_address
    add_column :spree_stores, :require_address, :boolean, default: true
    add_column :spree_stores, :country_id, :integer
    add_index :spree_stores, :country_id

    add_column :spree_stores, :state_id, :integer
    add_index :spree_stores, :state_id
  end
end
