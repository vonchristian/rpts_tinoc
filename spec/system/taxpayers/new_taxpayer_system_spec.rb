require 'rails_helper'

describe 'Save a taxpayer' do
  it 'with valid attributes' do
    visit taxpayers_url
    expect(page).to have_content("Taxpayers")
    click_link "New Taxpayer"
    fill_in "First name", with: "Von Christian"
    fill_in "Middle name", with: "Pinosan"
    fill_in "Last name", with: "Halip"
    fill_in "Email", with: "vc.halip@gmail.com"
    fill_in "Contact number", with: "09070678900"
    click_button "Save Taxpayer"

    expect(page).to have_content("saved successfully")
  end
end
