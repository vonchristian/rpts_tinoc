FactoryBot.define do
  factory :barangay, class: "Locations::Barangay" do
    municipality nil
    name "MyString"
  end
end
