FactoryBot.define do
  factory :post do
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/images.globe2.png'), filename: 'images.globe2.png')
    end
  end
end
