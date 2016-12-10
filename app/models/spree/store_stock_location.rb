module Spree
  class StoreStockLocation < ActiveRecord::Base
    belongs_to :store
    belongs_to :stock_location
  end
end
