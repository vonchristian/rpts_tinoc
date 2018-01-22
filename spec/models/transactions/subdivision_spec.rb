require 'rails_helper'

module Transactions
  describe Subdivision do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
      it { is_expected.to belong_to :divided_real_property }
    end
  end
end
