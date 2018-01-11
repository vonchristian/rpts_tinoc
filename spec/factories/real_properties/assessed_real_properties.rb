FactoryBot.define do
  factory :assessed_real_property, class: "RealProperties::AssessedRealProperty" do
    real_property nil
    number { Faker::Number.number }
    cancelled false
  end
end
