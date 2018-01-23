require 'rails_helper'

module RealProperties
  describe MarketValueAdjustment do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
      it { is_expected.to belong_to :adjustment_factor }
    end
    describe 'delegations' do
      it { is_expected.to delegate_method(:name).to(:adjustment_factor) }
      it { is_expected.to delegate_method(:percent).to(:adjustment_factor) }
      it { is_expected.to delegate_method(:market_value).to(:real_property) }
    end
    it ".tota(options={})" do
    end
  end
end
