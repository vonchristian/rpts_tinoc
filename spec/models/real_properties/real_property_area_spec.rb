require 'rails_helper'

module RealProperties
  describe RealPropertyArea do
    describe 'associations' do
      it { is_expected.to belong_to :real_property }
    end
  end
end
