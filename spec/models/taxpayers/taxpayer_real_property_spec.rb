require 'rails_helper'

module Taxpayers
  describe TaxpayerRealProperty do
    describe 'associations' do
      it { is_expected.to belong_to :taxpayer }
      it { is_expected.to belong_to :real_property }
    end
  end
end
