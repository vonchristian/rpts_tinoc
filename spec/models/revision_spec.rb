require 'rails_helper'

describe Revision do
  describe 'associations' do
    it { is_expected.to belong_to :real_property }
  end
end
