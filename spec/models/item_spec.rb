require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できる場合' do
      it '必要な情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it '商品画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がなければ出品できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がなければ出品できない' do
        @item.outline = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Outline can't be blank")
      end

      it 'カテゴリーの情報がなければ出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報がなければ出品できない' do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'state_idが1では出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it '配送料の負担の情報がなければ出品できない' do
        @item.postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it 'postage_idが1では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it '配送元の地域の情報がなければ出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の情報がなければ出品できない' do
        @item.waiting_days_until_shipment_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Waiting days until shipment can't be blank")
      end

      it 'waiting_days_until_shipment_idが1では出品できない' do
        @item.waiting_days_until_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Waiting days until shipment can't be blank")
      end

      it '価格の情報がなければ出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が10,000,000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が文字列では保存できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていなければ保存できない' do
        @item.user_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
