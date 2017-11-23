FactoryBot.define do
  factory :transfer do
    association :new_owner, factory: :taxpayer
    association :previous_owner, factory: :taxpayer
    real_property
  end
end
