require 'rails_helper'

RSpec.describe RealPropertyConsolidation, type: :model do
  describe 'assosciations' do
    it { is_expected.to belong_to :real_property }
    it { is_expected.to belong_to :consolidation }
  end
end
