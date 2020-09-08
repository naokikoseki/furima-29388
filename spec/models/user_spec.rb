require 'rails_helper'

RSpec.describe User, type: :model do
   describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmation、family_name,first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
       expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
       @user.nickname = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end

    it "emailが空では登録できないこと" do
       @user.email = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end

    it "passwordが空では登録できないこと" do
       @user.password = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
       @user.password_confirmation = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "family_nameが空では登録できないこと" do
       @user.family_name = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "first_nameが空では登録できないこと" do
       @user.first_name = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "family_name_kanaが空では登録できないこと" do
       @user.family_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages)
    end
  end
end
