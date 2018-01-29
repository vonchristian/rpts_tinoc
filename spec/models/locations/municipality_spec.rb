require 'rails_helper'

module Locations
  describe Municipality do
    describe 'associations' do
      it { is_expected.to belong_to :province }
      it { is_expected.to have_many :barangays }
    end
  end
end
