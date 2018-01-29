require 'rails_helper'
module RealProperties
  RSpec.describe AssessedRealProperty, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
      it { is_expected.to belong_to :general_revision }
      it { is_expected.to belong_to :municipality }
      it { is_expected.to belong_to :barangay }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :number }
      it { is_expected.to validate_uniqueness_of :number }
    end
  end
end
