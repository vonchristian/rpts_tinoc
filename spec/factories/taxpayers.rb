FactoryBot.define do
  factory :taxpayer do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.last_name }
    last_name  { Faker::Name.last_name }
    contact_number "MyString"
    email { Faker::Internet.email }
  end
end
