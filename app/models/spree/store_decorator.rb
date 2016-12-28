module Spree
  Store.class_eval do
    has_and_belongs_to_many :products, join_table: 'spree_products_stores'
    has_many :taxonomies
    has_many :orders

    has_many :store_payment_methods
    has_many :payment_methods, through: :store_payment_methods

    has_many :store_shipping_methods
    has_many :shipping_methods, through: :store_shipping_methods

    has_many :store_stock_locations
    has_many :stock_locations, through: :store_stock_locations

    has_and_belongs_to_many :promotion_rules, class_name: 'Spree::Promotion::Rules::Store', join_table: 'spree_promotion_rules_stores', association_foreign_key: 'promotion_rule_id'

    belongs_to :country
    belongs_to :state

    has_attached_file :logo,
      styles: { mini: '48x48>', small: '100x100>', medium: '250x250>' },
      default_style: :medium,
      url: 'stores/:id/:style/:basename.:extension',
      path: 'stores/:id/:style/:basename.:extension',
      convert_options: { all: '-strip -auto-orient' }

    if respond_to? :logo_file_name
      validates_attachment_file_name :logo, matches: [/png\Z/i, /jpe?g\Z/i]
    end

    def self.current_store
      Thread.current[:current_store] || Spree::Store.first
    end

    def self.current_store=(store)
      Thread.current[:current_store] = store
    end
  end
end
