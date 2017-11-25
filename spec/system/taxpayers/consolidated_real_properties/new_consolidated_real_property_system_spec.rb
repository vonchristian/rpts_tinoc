require 'rails_helper'

describe 'New consolidated real property' do
  it 'with valid attributes' do
    taxpayer = create(:taxpayer)
    visit taxpayers_url
    click_link taxpayer.first_and_last_name
    click_link 'New Consolidation'

    real_property = create(:real_property)
    select real_property.current_arp

    click_button "Add Real Property"

    expect(page).to have_content('added successfully')
  end
end
