require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる場合' do
      it '入力が正しければ登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameがなければ登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複するemailは登録できない' do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まなければ登録できない' do
        @user.email = 'email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordがなければ登録できない' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordが全角文字を含む場合は登録できない' do
        @user.password = 'パスワードパスワード'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（全角）を入力してください")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（全角）は不正な値です')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（全角）を入力してください")
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'Tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（全角）は不正な値です')
      end

      it 'last_name_pronunciationが空では登録できない' do
        @user.last_name_pronunciation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナ（全角）を入力してください")
      end

      it 'last_name_pronunciationは全角（カタカナ）でなければ登録できない' do
        @user.last_name_pronunciation = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナ（全角）は不正な値です')
      end

      it 'first_name_pronunciationが空では登録できない' do
        @user.first_name_pronunciation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ（全角）を入力してください")
      end

      it 'first_name_pronunciationは全角（カタカナ）でなければ登録できない' do
        @user.first_name_pronunciation = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（全角）は不正な値です')
      end

      it 'birthdayがなければ登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
