require 'rails_helper'

describe TaxDeclaration, type: :model do
  describe 'validations' do
    it { is_expected.to belong_to :real_property }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_uniqueness_of :number }
  end
end
