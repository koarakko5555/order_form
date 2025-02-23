module ProductDecorator
  def name_and_price_text
    "#{name}(#{number_to_currency(price)}/個)"
  end
end