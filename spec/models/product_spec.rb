require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '商品出品できるとき' do
      it '商品画像、商品名、商品説明、カテゴリー、商品状態、配送料の負担、発送元の地域、発送までの日数、販売価格が必須であること' do
        expect(@product).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it '商品画像が空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空だと出品できない' do
        @product.product_description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product description can't be blank")
      end
      it 'カテゴリーが空だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態が空だと出品できない' do
        @product.product_state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product state must be other than 1")
      end

      it '配送料の負担が空だと出品できない' do
        @product.freight_burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Freight burden must be other than 1")
      end

      it '発送元の地域が空だと出品できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 1")
      end
      it '発送までの日数が空だと出品できない' do
        @product.lead_time_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Lead time must be other than 1")
      end

      it '販売価格が空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が全角だと出品できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が半角英数字混合では出品できない' do
        @product.price = '111111aaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が半角英語だけでは出品できない' do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が300円未満だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 300")
      end

      it '販売価格が10000000円以上だと出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'ユーザーが紐づいていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end
    end
  end
end
