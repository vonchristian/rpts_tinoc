require 'rails_helper'

describe 'New Classification' do
  it 'with valid attributes' do
    visit settings_url
    click_link 'New Classification'
    fill_in 'Name', with: 'Sample classification'
    click_button "Save Classification"

    expect(page).to have_content('saved successfully')
  end
end
