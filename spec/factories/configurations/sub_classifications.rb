FactoryBot.define do
  factory :sub_classification, class: "Configurations::SubClassification" do
    classification
    name  { Faker::Commerce.product_name }
  end
end
