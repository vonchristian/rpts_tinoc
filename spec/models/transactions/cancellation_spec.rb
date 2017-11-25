require 'rails_helper'

module Transactions
  describe Cancellation, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
    end
  end
end
