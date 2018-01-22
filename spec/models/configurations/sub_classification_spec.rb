require 'rails_helper'

module Configurations
  describe SubClassification, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :classification }
      it { is_expected.to have_many :market_value_schedules }
    end
  end
end
