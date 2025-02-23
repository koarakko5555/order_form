# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  Order.delete_all
  PaymentMethod.delete_all
  InflowSource.delete_all
  Product.delete_all

  PaymentMethod.create(id: 1, name: 'クレジットカード')
  PaymentMethod.create(id: 2, name: '銀行振込')
  PaymentMethod.create(id: 3, name: '代引き')
  PaymentMethod.create(id: 4, name: 'コンビニ払い')
  PaymentMethod.create(id: 5, name: '郵便為替')

  InflowSource.create(id: 1, name: '検索エンジン')
  InflowSource.create(id: 2, name: 'm-1グランプリ')
  InflowSource.create(id: 3, name: 'r-1グランプリ')
  InflowSource.create(id: 4, name: 'キングオブコント')
  InflowSource.create(id: 5, name: '座セカンド')

  Product.create(id: 1, name: 'おいしいバナナ', price: 100)
  Product.create(id: 2, name: 'たのしいオレンジ', price: 200)
  Product.create(id: 3, name: 'さわやかアップル', price: 400)
  Product.create(id: 4, name: '元気なメロン', price: 600)
  Product.create(id: 5, name: 'やわらかピーチ', price: 450)
  Product.create(id: 6, name: '不思議なマンゴー', price: 1200)
end