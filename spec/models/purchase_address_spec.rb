require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @purchase = FactoryBot.build(:purchase_address)
    end

    context '購入できるとき' do
     it 'token,post_code,prefecture_id,city,house_number,building_name,phone_numberがあれば購入できる' do
      expect(@purchase).to be_valid
     end
     it 'building_nameが空でも購入できる' do
      @purchase.building_name = nil
      expect(@purchase).to be_valid
     end
     it '電話番号が10桁でも購入できる' do
      @purchase.phone_number = '0120828828'
      expect(@purchase).to be_valid
     end
    end
    
    context '購入できないとき' do
      it 'tokenが空では購入できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end

      it 'post_codeが空では購入できない' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      it 'post_codeに-が入ってなければ購入できない' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      it 'post_codeは全角数字では購入できない' do
        @purchase.post_code = '１２３-４５６７'
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end

      it 'prefecture_idが空では購入できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      it 'prefecture_idが0では購入できない' do
        @purchase.prefecture_id = '0'
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      
      it 'cityが空欄では購入できない' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end

      it 'house_numberが空欄では購入できない' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end

      it 'phone_numberが空欄では購入できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      it 'phone_numberが半角数字でなければ購入できない' do
        @purchase.phone_number = '０９０１２３４５６７８'
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      it 'phone_numberに"-"などが含まれていたら購入できない' do
        @purchase.phone_number = '090-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
      it 'phone_numberが10桁未満だと購入できない' do
        @purchase.phone_number = '090123456'
        @purchase.valid?
        expect(@purchase.errors.full_messages)
      end
    end
  end
end
