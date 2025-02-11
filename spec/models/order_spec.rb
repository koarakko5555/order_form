require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    let(:name) { 'サンプルマン' }
    let(:email) { 'test@example.com' }
    let(:telephone) { '0312345678' }
    let(:delivery_address) { '東京都葛飾区亀有公園前' }
    let(:params) do
      {
        name:,
        email:,
        telephone:,
        delivery_address:
      }
    end

    it '返り値はtrueになること' do
      order = Order.new(params)
      expect(order.valid?).to eq true
    end
  end
end
