require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#create' do
    before do
      @profile = FactoryBot.build(:profile)
    end

    it 'customer_name、customer_occupationが存在すれば登録できること' do
      expect(@profile).to be_valid
    end

    it 'customer_nameが空では登録できないこと' do
      @profile.customer_name = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include('氏名を入力してください')
    end

    it 'customer_occupationが空では登録できないこと' do
      @profile.customer_occupation = nil
      @profile.valid?
      expect(@profile.errors.full_messages).to include('所属を入力してください')
    end
  end
end
