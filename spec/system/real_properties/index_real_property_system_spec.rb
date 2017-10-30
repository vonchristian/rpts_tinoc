require 'rails_helper'

describe 'List of real properties' do
  it 'with valid attributes' do
    visit real_properties_url

    expect(page).to have_content("Real Properties")
  end
end
