require 'rails_helper'

describe RealProperty do
  describe 'associations' do
    it { is_expected.to have_many :taxpayers }
    it { is_expected.to have_many :taxpayer_real_properties }
  end
end
