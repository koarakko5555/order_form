class Product < ApplicationRecord
  class << self
    def selectable_products
      all.map { |product| [ActiveDecorator::Decorator.instance.decorate(product).name_and_price_text, product.id] }
    end
  end
end