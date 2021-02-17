FactoryBot.define do
  factory :product do
    product_name        {Faker::Lorem.word}
    product_description {Faker::Lorem.sentence}
    price               {Faker::Number.within(range: 300..9999999)}
    category_id         {Faker::Number.within(range: 2..10)}
    product_state_id    {Faker::Number.within(range: 2..7)}
    freight_burden_id   {Faker::Number.within(range: 2..3)}
    area_id             {Faker::Number.within(range: 2..48)}
    lead_time_id        {Faker::Number.within(range: 2..4)}

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
