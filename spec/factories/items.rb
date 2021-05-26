FactoryBot.define do
  factory :item do
    title           {"テスト"}
    text            {"テスト"}
    category_id     {Faker::Number.between(from: 2, to: 3)}
    status_id       {Faker::Number.between(from: 2, to: 3)}
    shipping_fee_id {Faker::Number.between(from: 2, to: 3)}
    prefecture_id   {Faker::Number.between(from: 2, to: 3)}
    delivery_id     {Faker::Number.between(from: 2, to: 3)}
    price           {Faker::Number.between(from: 300, to: 1000)}    
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image_test.png'), filename: 'image_test.png')
    end
  end
end
