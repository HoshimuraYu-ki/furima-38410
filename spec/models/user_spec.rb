require 'rails_helper'

RSpec.describe User, type: :model do
   
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録ができる時" do
      it "全ての入力項目が存在すれば新規登録できる" do
        expect(@user).to be_valid
      end
    end

    context "新規登録ができない時" do
      it "user_nicknameが空だと登録できない" do
        @user.user_nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = 'test_gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが登録済みだと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = '1234a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが129文字以上だと登録できない" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが英字のみだと登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角を含むと登録できない" do
        @user.password = "a1A1Ａ１"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "名字が空だと登録できない" do
        @user.user_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name can't be blank")
      end
      it "名前が空だと登録できない" do
        @user.user_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name can't be blank")
      end
      it "名字は全角（漢字,ひらがな,カタカナ）でなければ登録できない" do
        @user.user_last_name = "Sei"
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name is invalid")
      end
      it "名前は全角（漢字,ひらがな,カタカナ）でなければ登録できない" do
        @user.user_first_name = "Mei"
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name is invalid")
      end
      it "フリガナ（名字）が空だと登録できない" do
        @user.user_last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name kana can't be blank")
      end
      it "フリガナ（名前）が空だと登録できない" do
        @user.user_first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name kana can't be blank")
      end
      it "フリガナ（名字）は全角（カタカナ）でなければ登録できない" do
        @user.user_last_name_kana = "せい"
        @user.valid?
        expect(@user.errors.full_messages).to include("User last name kana is invalid")
      end
      it "フリガナ（名前）は全角（カタカナ）でなければ登録できない" do
        @user.user_first_name_kana = "めい"
        @user.valid?
        expect(@user.errors.full_messages).to include("User first name kana is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.user_date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("User date of birth can't be blank")
      end
    end

  end



end
