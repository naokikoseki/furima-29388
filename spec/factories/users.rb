FactoryBot.define do
  factory :user do
    nickname               {"syo"}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    family_name            {"櫻井"}
    first_name             {"翔"}
    family_name_kana       {"サクライ"}
    first_name_kana        {"ショウ"}
    birthday               {"1982-1-25"}
  end
end
