require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    let(:name) { 'デキズマン' }
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

    # モデルの中で良く使われる書き方
    subject { Order.new(params).valid? }

    it { is_expected.to eq true }

    # contextはテストコードの分岐が可能（上のletを引き継いで、下のletで更新される）
    context '名前が空白の場合' do
      let(:name){ '' }
      it { is_expected.to eq false }
    end

    context 'メールアドレスが空白の場合' do
      let(:email){ '' }
      it { is_expected.to eq false }
    end

    context 'メールアドレスの書式が正しくない場合' do
      let(:email){ 'textexample.com' }
      it { is_expected.to eq false }
    end

    context 'メールアドレスが全角の場合' do
      let(:email){ 'ｒｓｗｑｐｋ＠ｖｒｗ' }
      it { is_expected.to eq false }
    end

    context '電話番号が空白の場合' do
      let(:telephone){ '' }
      it { is_expected.to eq false }
    end

    context '電話番号が全角の場合' do
      let(:telephone){ '０３１２３４５６７８' }
      it { is_expected.to eq true }
    end

    context '電話番号に数字以外が含まれている場合' do
      let(:telephone){ '090-1234-5678' }
      it { is_expected.to eq true }
    end

    context '電話番号が12桁の場合' do
      let(:telephone){ '090123456789' }
      it { is_expected.to eq false }
    end

    context 'お届け先住所が空白の場合' do
      let(:delivery_address){ '' }
      it { is_expected.to eq false }
    end
  end
end
