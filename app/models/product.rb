class Product < ApplicationRecord
  class << self
    def selectable_products
      all.map { |product| [product.name, product.id] }
    end
  end
end