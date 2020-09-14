require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
   context "出品できるとき" do
    it "image,name,explanation,category,status,fee,region,shipment_day,priceが存在すれば出品できること" do
     expect(@item).to be_valid
    end
   end
   context "出品できないとき" do
     it "imageが空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages)
     end
     it "nameが空では出品できないこと" do
       @item.name = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "explanationが空では出品できないこと" do
       @item.explanation = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     # category
     it "categoryが空では出品できないこと" do
       @item.category = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "categoryが -- のままでは出品できないこと" do
       @item.category = "0"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     # status
     it "statusが空では出品できないこと" do
       @item.status = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "statusが -- のままでは出品できないこと" do
       @item.status = "0"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     # fee
     it "feeが空では出品できないこと" do
       @item.fee = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "feeが -- のままでは出品できないこと" do
       @item.fee = "0"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     # region
     it "regionが空では出品できないこと" do
       @item.region = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "regionが -- のままでは出品できないこと" do
       @item.region = "0"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     # shipment_day
     it "shipment_dayが空では出品できないこと" do
       @item.shipment_day = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "shipment_dayが -- のままでは出品できないこと" do
       @item.shipment_day = "0"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     # price
     it "priceが空では出品できないこと" do
       @item.price = nil
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "priceが半角数字でなければ出品できないこと" do
       @item.price = "３０００"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "priceが300未満であれば出品できないこと" do
       @item.price = "10"
       @item.valid?
       expect(@item.errors.full_messages)
     end
     it "priceが9,999,999より大きければ出品できないこと" do
       @item.price = "100000000000000"
       @item.valid?
       expect(@item.errors.full_messages)
     end
   end
  end 
end
