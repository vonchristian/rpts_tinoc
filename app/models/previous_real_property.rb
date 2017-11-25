class PreviousRealProperty < ApplicationRecord
  belongs_to :latest_real_property, class_name: "RealProperty", foreign_key: 'latest_real_property_id'
  belongs_to :old_real_property, class_name: "RealProperty", foreign_key: 'old_real_property_id'

  def self.latest_for(real_property)
    latest = all.where(old_real_property_id: real_property.id).order(created_at: :asc).last
    if latest.present?
      latest.latest_real_property
    end
  end

  def self.add_previous_real_properties(old_real_property, new_real_property)
    if old_real_property.previous_real_properties.present?
      old_real_property.previous_real_properties.each do |real_property|
        new_real_property.previous_real_properties.find_or_create_by(old_real_property_id: real_property.old_real_property_id)
      end
      new_real_property.previous_real_properties.find_or_create_by(old_real_property_id: old_real_property.id)
    else
      new_real_property.previous_real_properties.find_or_create_by(old_real_property_id: old_real_property.id)
    end
  end
end
