require 'rails_helper'

describe 'Show Real Property' do
  it "is valid" do
  real_property = create(:real_property, description: "House and Lot")
  visit real_properties_url
  click_link real_property.description

  expect(page).to have_content(real_property.description)
end
end
