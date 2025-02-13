class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods, comment: '支払い方法' do |t|
      t.string :name, comment: '名称'

      t.timestamps
    end
  end
end
