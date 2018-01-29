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
    describe 'scopes' do
      it '.active' do
        cancelled_arp = create(:assessed_real_property)
        active_arp = create(:assessed_real_property)

        cancelled_arp.cancel!

        expect(RealProperties::AssessedRealProperty.active).to include(active_arp)
        expect(RealProperties::AssessedRealProperty.active).to_not include(cancelled_arp)
      end
    end
  end
end
