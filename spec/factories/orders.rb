FactoryBot.define do
  factory :order do
    name { 'サンプルマン' }
    email { 'test@example.com' }
    telephone { '0312345678' }
    delivery_address { '東京都新宿区亀有公園前' }
    payment_method_id { 1 }
    other_comment { 'テスト投稿です' }
    direct_mail_enabled { true }
  end
end
