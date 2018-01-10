require 'rails_helper'

module Configurations
  describe PenaltyConfig do
    describe 'validations' do
      it { is_expected.to validate_presence_of :max_no_month }
      it { is_expected.to validate_presence_of :penalty_rate }
      it { is_expected.to validate_numericality_of :max_no_month }
      it { is_expected.to validate_numericality_of :penalty_rate }
    end
  end
end
