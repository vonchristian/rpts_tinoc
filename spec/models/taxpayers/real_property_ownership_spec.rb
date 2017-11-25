require 'rails_helper'

module Taxpayers
  describe RealPropertyOwnership do
    describe 'associations' do
      it { is_expected.to belong_to :property_owner }
      it { is_expected.to belong_to :real_property }
    end
  end
end
