require 'rails_helper'

module RealProperties
  RSpec.describe RealPropertyConsolidation, type: :model do
    describe 'assosciations' do
      it { is_expected.to belong_to :real_property }
      it { is_expected.to belong_to :consolidation }
      it { is_expected.to belong_to :consolidator }
    end
  end
end
