require 'rails_helper'

describe Taxation do
  describe 'associations' do
    it { is_expected.to belong_to :real_property }
    it { is_expected.to belong_to :general_revision }
  end
end
