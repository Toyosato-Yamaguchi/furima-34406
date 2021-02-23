require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能の実装' do
    before do 
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, product_id: product.id)
      sleep(0.1)
    end

    context '商品が購入できる' do
      it '全て正常に入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない' do
      it 'tokenが空では決済ができないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと登録できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空だと登録できない' do
        @purchase_address.product_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Product can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = 1234567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が正しく選択していないと保存できないこと' do
        @purchase_address.region_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Region must be other than 1")
      end
      it '市町村が空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_address.block = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は11桁以内の数値のみでないと保存できないこと' do
        @purchase_address.phone = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @purchase_address.phone = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号に英字があると保存できないこと' do
        @purchase_address.phone = '123456789aa'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end
