require 'rails_helper'

describe 'Index settings page' do
  it 'with valid attributes' do
    visit settings_url

    expect(page).to have_content('Settings')
  end
end
