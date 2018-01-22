require 'rails_helper'
module Transactions
  RSpec.describe TransferTransaction, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :grantee }
      it { is_expected.to belong_to :grantor }
      it { is_expected.to belong_to :transferred_real_property }
    end
  end
end
