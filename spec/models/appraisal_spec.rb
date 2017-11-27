require 'rails_helper'

RSpec.describe Appraisal, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :classification }
    it { is_expected.to belong_to :sub_classification }
    it { is_expected.to belong_to :real_property }
  end
end
