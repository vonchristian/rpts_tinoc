FactoryBot.define do
  factory :assessed_real_property do
    real_property nil
    number { Faker::Number.number }
    cancelled false
  end
end
