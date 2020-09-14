require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
   # 登録できるとき
    it "nicknameとemail、passwordとpassword_confirmation、family_name,first_name,family_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
       expect(@user).to be_valid
    end
   # 登録できないとき
    # nickname
    it "nicknameが空では登録できないこと" do
       @user.nickname = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    # email
    it "emailが空では登録できないこと" do
       @user.email = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "すでに登録されているemailは登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages)
    end
    it "emailに＠が含まれていなければ登録できないこと" do
      @user.email = "email"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    # password
    it "passwordが空では登録できないこと" do
       @user.password = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "passwordは英字だけでは登録できないこと" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "passwordは数字だけでは登録できないこと" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "passwordは５文字以下では登録できないこと" do
      @user.password = "1a1a1"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
       @user.password_confirmation = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "passwordとpassword_confirmationが一致しないと登録できないこと" do
      @user.password = "1a1a1a"
      @user.password_confirmation = "2b2b2b"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    # family_name
    it "family_nameが空では登録できないこと" do
       @user.family_name = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "family_nameは漢字・カタカナ・ひらがな以外が含まれると登録できないこと" do
      @user.family_name = "cabrera"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    # first_name
    it "first_nameが空では登録できないこと" do
       @user.first_name = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "first_nameは漢字・カタカナ・ひらがな以外が含まれると登録できないこと" do
      @user.first_name = "alex"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    # _kana
    it "family_name_kanaが空では登録できないこと" do
       @user.family_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages)
    end
    it "family_name_kanaはカタカナ以外が含まれると登録できないこと" do
      @user.family_name_kana = "さとう"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "first_name_kanaはカタカナ以外が含まれると登録できないこと" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    # birthday
    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages)
    end
  end
end
