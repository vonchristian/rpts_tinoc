require 'rails_helper'

describe 'New revision' do
  it 'with valid attributes' do
    real_property = create(:real_property)
    visit real_properties_url
    click_link real_property.description
    click_link 'New Revision'

    fill_in "Date", with: Date.today
    click_button "Save Revision"

    expect(page).to have_content('saved successfully')
  end
end
