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
        expect(@item.errors.full_messages).to include("商品画像を選択してください")
      end

      it '商品名がなければ出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明がなければ出品できない' do
        @item.outline = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報がなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選んでください")
      end

      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選んでください")
      end

      it '商品の状態の情報がなければ出品できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選んでください")
      end

      it 'state_idが1では出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選んでください")
      end

      it '配送料の負担の情報がなければ出品できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選んでください")
      end

      it 'postage_idが1では出品できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選んでください")
      end

      it '配送元の地域の情報がなければ出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選んでください")
      end

      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選んでください")
      end

      it '発送までの日数の情報がなければ出品できない' do
        @item.waiting_days_until_shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選んでください")
      end

      it 'waiting_days_until_shipment_idが1では出品できない' do
        @item.waiting_days_until_shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選んでください")
      end

      it '価格の情報がなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end

      it '価格が10,000,000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end

      it '価格が文字列では保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end

      it 'userが紐付いていなければ保存できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザー情報を入力してください')
      end
    end
  end
end
