require 'rails_helper'

describe 'New real property transfer' do
  it 'with valid attributes' do
    old_owner = create(:taxpayer)
    real_property = create(:real_property, description: 'House and Lot')
    new_owner = create(:taxpayer)
    visit real_properties_url
    click_link 'House and Lot'
    click_link 'New Transfer'
    select new_owner.first_name
    fill_in 'Date transferred', with: Date.today
    click_button "Save Transfer"

    expect(page).to have_content('saved successfully')
  end
end
