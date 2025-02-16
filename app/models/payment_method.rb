class PaymentMethod < ApplicationRecord
  class << self
    def selectable_methods
      all.map { |method| [method.name, method.id] }
    end
  end
end