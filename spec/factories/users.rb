FactoryBot.define do
  factory :user do    
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    user_name             {Faker::Name.last_name}
    nickname              {Faker::Name.last_name}
    position              {'投手'}
    pitching              {'右投げ右打ち'}
    age                   {'24'}
    area                  {'岩手'}
    year                  {'14'}
    fan                   {'ヤクルト'}    
  end
end