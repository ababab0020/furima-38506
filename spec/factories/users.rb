FactoryBot.define do
  factory :user do
    name {Faker::Name.name }
    family_name{Faker::Name.last_name}
    first_name{Faker::Name.first_name }
    family_name_kana{"ア"}
    first_name_kana{"ア"}
    birth_day{Faker::Date.birthday(min_age: 18, max_age: 65)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end