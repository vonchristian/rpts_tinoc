require 'rails_helper'

describe "New real property" do
  it 'with valid attributes' do
    taxpayer = create(:taxpayer)
    visit taxpayers_url
    click_link taxpayer.first_name
    click_link 'New Real Property'

    fill_in "Description", with: "House and Lot"
    fill_in 'Number', with: '00-990334-13'
    click_button "Save Real Property"

    expect(page).to have_content("saved successfully")
  end
end
