require 'rails_helper'

describe 'New tax declaration' do
  it 'with valid attributes' do
    real_property = create(:real_property)
    visit real_properties_url
    click_link real_property.description
    click_link 'New Tax Declaration'

    fill_in "Number", with: '424234-42343243'
    click_button "Save Tax Declaration"

    expect(page).to have_content('saved successfully')
  end
end
