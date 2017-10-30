require 'rails_helper'

describe Taxpayer do
  describe 'associations' do
    it { is_expected.to have_many :taxpayer_real_properties }
    it { is_expected.to have_many :real_properties }
  end
end