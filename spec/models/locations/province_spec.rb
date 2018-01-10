require 'rails_helper'

module Locations
  describe Province do
    describe 'associations' do
      it { is_expected.to have_many :municipalities }
    end
    describe 'validations' do
      it { is_expected.to validate_presence_of :name }
      it { is_expected.to validate_uniqueness_of :name }
    end
  end
end
