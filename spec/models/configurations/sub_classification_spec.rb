require 'rails_helper'

module Configurations
  describe SubClassification, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :classification }
    end
  end
end
