require 'rails_helper'

RSpec.describe Tin, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :tinable }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_presence_of :date_issued }
    it { is_expected.to validate_uniqueness_of :number }
  end

end
