require 'rails_helper'

module RealProperties
  describe RealPropertyClassification do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
      it { is_expected.to belong_to :classification }
    end

    describe 'delegations' do
      it { is_expected.to delegate_method(:assessment_level).to(:classification) }
      it { is_expected.to delegate_method(:name).to(:classification) }
    end
  end
end
