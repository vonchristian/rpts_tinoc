require 'rails_helper'

module Transactions
  describe Revision do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
    end
  end
end
