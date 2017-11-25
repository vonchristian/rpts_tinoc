FactoryBot.define do
  factory :real_property_ownership, class: "Taxpayers::RealPropertyOwnership" do
    taxpayer
    real_property
  end
end
