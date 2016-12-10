class AddStockLocationToStores < ActiveRecord::Migration
  def change
    create_table :spree_store_stock_locations do |t|
      t.integer :store_id
      t.integer :stock_location_id

      t.timestamps null: false
    end

    add_index :spree_store_stock_locations, :store_id
    add_index :spree_store_stock_locations, :stock_location_id
  end
end
