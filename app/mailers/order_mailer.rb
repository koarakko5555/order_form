class OrderMailer < ApplicationMailer
  def mail_to_user(order_id)
    @order = Order.find(order_id)
    mail(to: @order.email, subject: 'ご注文ありがとうございます')
  end
end