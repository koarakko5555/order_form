# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  PaymentMethod.delete_all

  PaymentMethod.create(id: 1, name: 'クレジットカード')
  PaymentMethod.create(id: 2, name: '銀行振込')
  PaymentMethod.create(id: 3, name: '代引き')
  PaymentMethod.create(id: 4, name: 'コンビニ払い')
  PaymentMethod.create(id: 5, name: '郵便為替')
end