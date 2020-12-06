require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "email、passwordとpassword_confirmation、nameが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordが半角英数字をそれぞれ含む8文字以上であれば登録できること" do
      @user.password = "1111aaaa"
      @user.password_confirmation = "1111aaaa"
      expect(@user).to be_valid
    end

    it "passwordが半角英数字をそれぞれ含まなければ登録できないこと" do
      @user.password = "11111111"
      @user.password_confirmation = "11111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは半角英数字で入力してください")
    end

    it "passwordが7文字以下であれば登録できないこと" do
      @user.password = "1111aaa"
      @user.password_confirmation = "1111aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
    end

    it "nameが空では登録できないこと" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("氏名を入力してください")
    end

  end
end