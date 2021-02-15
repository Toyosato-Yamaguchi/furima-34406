require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できるとき' do
      it "nickname、email、password、password_confirmation、名字と名前、フリガナ、生年月日が必須であること" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がないと登録できない" do
        @user.nickname = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英数字混合していても5文字以下では登録できない" do
        @user.password = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "paswordが英字のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが数字のみの場合は登録できないこと" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
        @user.password = '111aaa'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it "名字が空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名字が全角（漢字、ひらがな、カタカナ）でないと登録できない" do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が全角（漢字、ひらがな、カタカナ）でないと登録できない" do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "名字のふりがなが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "名字のふりがながカタカナでないと登録できない" do
        @user.last_name_kana = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
      it "名前のふりがなが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "名前のふりがながカタカナでないと登録できない" do
        @user.first_name_kana = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
      it "誕生日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
