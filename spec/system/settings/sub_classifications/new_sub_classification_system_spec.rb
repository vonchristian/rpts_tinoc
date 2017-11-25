require 'rails_helper'

describe 'New Classification' do
  it 'with valid attributes' do
    classification = create(:classification)
    visit settings_url
    click_link classification.name
    click_link 'New Sub Classification'
    fill_in 'Name', with: 'Sample classification'
    click_button "Save Sub Classification"

    expect(page).to have_content('saved successfully')
  end
end
