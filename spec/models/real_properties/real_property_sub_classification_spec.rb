require 'rails_helper'

module RealProperties
  describe RealPropertySubClassification do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
      it { is_expected.to belong_to :sub_classification }
    end

    describe 'delegations' do
      it { is_expected.to delegate_method(:current_market_value).to(:sub_classification) }
    end
  end
end
