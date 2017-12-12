require 'rails_helper'

module RealProperties
  RSpec.describe PropertyAdministration, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :administrator }
      it { is_expected.to belong_to :real_property }
    end
  end
end
