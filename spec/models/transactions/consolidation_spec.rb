require 'rails_helper'

module Transactions
  RSpec.describe Consolidation, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :consolidator }
      it { is_expected.to have_many :real_property_consolidations }
      it { is_expected.to have_many :consolidated_real_properties }
    end
  end
end
