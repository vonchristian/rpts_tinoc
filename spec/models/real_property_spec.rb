require 'rails_helper'

describe RealProperty do
  describe 'associations' do
    it { is_expected.to have_one :location }
    it { is_expected.to belong_to :municipality }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to have_many :property_owners }
    it { is_expected.to have_many :real_property_ownerships }
    it { is_expected.to have_many :assessed_real_properties }
    it { is_expected.to have_one :transfer_transaction }
    it { is_expected.to have_many :property_boundaries }
    it { is_expected.to have_many :north_property_boundaries }
    it { is_expected.to have_many :south_property_boundaries }
    it { is_expected.to have_many :property_administrations }
    it { is_expected.to have_many :encumberances }
    it { is_expected.to have_many :north_property_boundaries }
    it { is_expected.to have_many :south_property_boundaries }
    it { is_expected.to have_many :east_property_boundaries }
    it { is_expected.to have_many :west_property_boundaries }
    it { is_expected.to have_many :assessed_values }
    it { is_expected.to have_many :real_property_taxes }
    it { is_expected.to have_many :taxations }
  end

   describe 'enums' do
    it { is_expected.to define_enum_for(:taxability).with([:taxable, :exempted]) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:current_owner).with_prefix }
  end

  it '#current_arp' do
    real_property = create(:real_property)
    first_arp = create(:assessed_real_property, real_property: real_property)
    second_arp = create(:assessed_real_property, real_property: real_property)

    expect(real_property.current_arp).to eql(second_arp.number)
  end

end
