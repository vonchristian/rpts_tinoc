require 'rails_helper'

describe 'New Assessed Real Property' do
  it 'with valid attributes' do
    real_property = create(:real_property)
    visit real_properties_url
    click_link real_property.description
    click_link 'New ARP'
    fill_in 'Number', with: '09090-90900-12030'
    click_button "Save ARP"

    expect(page).to have_content('saved successfully')
  end
end
