FactoryBot.define do
  factory :street, class: "Locations::Street" do
    barangay nil
    name "MyString"
  end
end
