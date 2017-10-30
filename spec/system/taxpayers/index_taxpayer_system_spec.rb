require 'rails_helper'

describe 'List of taxpayers' do
  it 'with valid attributes' do
    visit taxpayers_url

    expect(page).to have_content("Taxpayers")
  end
end
