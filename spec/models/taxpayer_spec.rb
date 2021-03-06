require 'rails_helper'

describe Taxpayer do
  describe 'associations' do
    it { is_expected.to have_one :tin }
    it { is_expected.to have_many :real_property_ownerships }
    it { is_expected.to have_many :real_properties }
    it { is_expected.to have_many :received_transferred_real_properties }
    it { is_expected.to have_many :consolidations }
    it { is_expected.to have_many :real_property_consolidations }
    it { is_expected.to have_many :consolidated_real_properties }
    it { is_expected.to have_many :property_administrations }
  end
end
