require 'rails_helper'

describe 'New revision' do
  it 'with valid attributes' do
    real_property = create(:real_property)
    tax_declaration = create(:tax_declaration, real_property: real_property, cancelled: false)
    visit real_properties_url
    click_link real_property.description
    click_link 'New Revision'

    fill_in "Date", with: Date.today
    click_button "Save Revision"

    expect(page).to have_content('saved successfully')
    expect(tax_declaration.cancelled).to eql true
  end
end
