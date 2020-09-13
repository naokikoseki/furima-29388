FactoryBot.define do
  factory :item do
    #image                  {item_picture}
    name                   { "商品名" }
    explanation            { "商品説明" }
    category               { "1" }
    status                 { "1" }
    fee                    { "1" }
    region                 { "1" }
    shipment_day           { "1" }
    price                  { "500" }

    association :user

    
     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
  end
end
