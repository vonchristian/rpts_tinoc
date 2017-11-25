FactoryBot.define do
  factory :classification, class: "Configurations::Classification" do
    name { Faker::Commerce.product_name }
  end
end
