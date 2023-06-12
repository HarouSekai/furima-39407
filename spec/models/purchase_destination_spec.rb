require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:purchase_destination, user_id: item.user_id, item_id: item.id)
  end

  describe '商品の購入' do
    context '購入できる場合' do
      it '必要な情報があれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名がなくても購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '購入できない場合' do
      it '紐づく購入者がいなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('ユーザー情報を入力してください')
      end

      it '紐づく商品がなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('商品情報を入力してください')
      end

      it 'tokenがなければ購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('クレジットカード情報を入力してください')
      end

      it '郵便番号がなければ購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号を入力してください')
      end

      it '郵便番号は「3桁ハイフン4桁」でなければ購入できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は不正な値です。ハイフン (-) を入れてください')
      end

      it '郵便番号が全角では購入できない' do
        @order.post_code = '１２３－４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号は不正な値です。ハイフン (-) を入れてください')
      end

      it '都道府県がなければ購入できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('都道府県を選んでください')
      end

      it '都道府県はidが1では購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('都道府県を選んでください')
      end

      it '市区町村がなければ購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('市区町村を入力してください')
      end

      it '番地がなければ購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('番地を入力してください')
      end

      it '電話番号がなければ購入できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号を入力してください')
      end

      it '電話番号が9桁以下では購入できない' do
        @order.telephone_number = '098765432'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号が12桁以上では購入できない' do
        @order.telephone_number = '098765432112'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号が全角では購入できない' do
        @order.telephone_number = '０９８７６５４３２１'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end

      it '電話番号に文字列が入っていては購入できない' do
        @order.telephone_number = '090-8765-4321'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
    end
  end
end
