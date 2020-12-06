require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe '#create' do
    before do
      @appointment = FactoryBot.build(:appointment)
    end

    it "title、company、customer、date、place、purpose、relation_idが存在すれば登録できること" do
      expect(@appointment).to be_valid
    end

    it "titleが空では登録できないこと" do
      @appointment.title = nil
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("タイトルを入力してください")
    end

    it "companyが空では登録できないこと" do
      @appointment.company = nil
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("取引先名を入力してください")
    end

    it "customerが空では登録できないこと" do
      @appointment.customer = nil
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("顧客名を入力してください")
    end

    it "dateが空では登録できないこと" do
      @appointment.date = nil
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("日程を入力してください")
    end

    it "placeが空では登録できないこと" do
      @appointment.place = nil
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("場所を入力してください")
    end

    it "purposeが空では登録できないこと" do
      @appointment.purpose = nil
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("目的を入力してください")
    end

    it "relation_idが1では登録できないこと" do
      @appointment.relation_id = "1"
      @appointment.valid?
      expect(@appointment.errors.full_messages).to include("取引状況を入力してください")
    end

  end
end
