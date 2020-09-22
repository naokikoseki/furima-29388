FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '新宿区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678'}
    token {'00000000'}
    user_id {'1'}
    item_id {'1'}
  end
end
