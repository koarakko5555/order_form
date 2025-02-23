class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, comment: '商品マスタ' do |t|
      t.string :name, comment: '商品名'
      t.integer :price, comment: '価格'

      t.timestamps
    end
  end
end
