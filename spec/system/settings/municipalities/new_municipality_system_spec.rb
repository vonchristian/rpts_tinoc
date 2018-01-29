require 'rails_helper'

feature 'New Municipality' do
  before(:each) do
    user = create(:user)
    login_as(user, scope: user)
    visit settings_url
    click_link "New Municipality"
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: "Tinoc"
    click_button "Save"

    expect(page).to have_content('saved successfully')
  end
end
