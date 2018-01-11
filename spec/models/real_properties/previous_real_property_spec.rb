require 'rails_helper'

RSpec.describe PreviousRealProperty, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :latest_real_property }
    it { is_expected.to belong_to :old_real_property }
  end

  it '.latest_for(real_property)' do
   new_real_property = create(:real_property)
    old_real_property = create(:real_property)
    oldest_real_property = create(:real_property)
    PreviousRealProperty.add_previous_real_properties(oldest_real_property, old_real_property)
    PreviousRealProperty.add_previous_real_properties(old_real_property, new_real_property)

    expect(PreviousRealProperty.latest_for(oldest_real_property)).to eql(new_real_property)
    expect(PreviousRealProperty.latest_for(old_real_property)).to eql(new_real_property)
    expect(PreviousRealProperty.latest_for(new_real_property)).to be nil

  end
  it '.add_previous_real_properties(old_real_property, new_real_property)' do
    new_real_property = create(:real_property)
    old_real_property = create(:real_property)
    oldest_real_property = create(:real_property)
    PreviousRealProperty.add_previous_real_properties(oldest_real_property, old_real_property)
    PreviousRealProperty.add_previous_real_properties(old_real_property, new_real_property)

    expect(oldest_real_property.previous_real_properties.count).to be 0
    expect(old_real_property.previous_real_properties.pluck(:old_real_property_id)).to include(oldest_real_property.id)
    expect(old_real_property.previous_real_properties.count).to be 1
    expect(old_real_property.previous_real_properties.pluck(:old_real_property_id)).to_not include(new_real_property.id)

    expect(new_real_property.previous_real_properties.pluck(:old_real_property_id)).to include(old_real_property.id)
    expect(new_real_property.previous_real_properties.pluck(:old_real_property_id)).to include(oldest_real_property.id)
    expect(new_real_property.previous_real_properties.count).to be 2
  end
end
