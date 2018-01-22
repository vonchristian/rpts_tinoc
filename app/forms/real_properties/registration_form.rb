module RealProperties
  class RegistrationForm
    include ActiveModel::Model
    attr_accessor :sub_classification_id, :classification_id, :taxpayer_id, :description, :area, :type
    def save
      ActiveRecord::Base.transaction do
        create_real_property
      end
    end

    private
    def find_taxpayer
      Taxpayer.find_by_id(taxpayer_id)
    end

    def create_real_property
      real_property = find_taxpayer.real_properties.create(type: type, description: description)
      real_property.real_property_areas.create(area: area)
      real_property.real_property_sub_classifications.create(sub_classification_id: sub_classification_id)
      real_property.real_property_classifications.create(classification_id: classification_id)

    end
  end
end
