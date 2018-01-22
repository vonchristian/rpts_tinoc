require 'rails_helper'

module Configurations
  describe MarketValueSchedule, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :municipality }
      it { is_expected.to belong_to :sub_classification }
    end
  end
end
