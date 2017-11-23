require 'rails_helper'

RSpec.describe TransferTransaction, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :real_property }
    it { is_expected.to belong_to :new_owner }
    it { is_expected.to belong_to :previous_owner }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :date_transferred }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:description).to(:real_property).with_prefix }
  end
end
