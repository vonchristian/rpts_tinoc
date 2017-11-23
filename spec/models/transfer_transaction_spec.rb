require 'rails_helper'

RSpec.describe TransferTransaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :real_property }
    it { is_expected.to belong_to :new_owner }
    it { is_expected.to belong_to :previous_owner }
  end
end
