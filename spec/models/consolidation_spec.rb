require 'rails_helper'

RSpec.describe Consolidation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :consolidator }
    it { is_expected.to have_many :real_property_consolidations }
  end
end
