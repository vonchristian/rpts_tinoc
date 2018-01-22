module RealProperties
  class ConsolidationForm
    include ActiveModel::Model
    attr_accessor :consolidator_id, :consolidator_type, :area, :date, :sub_classification_id, :classification_id, :description, :type

    def save
      ActiveRecord::Base.transaction do
        create_consolidation
      end
    end

    def find_taxpayer
      Taxpayer.find_by_id(consolidator_id)
    end

    private
    def create_consolidation
      new_real_property = RealProperty.create(type: type)
      new_real_property.real_property_sub_classifications.create(sub_classification_id: sub_classification_id)
      new_real_property.real_property_classifications.create(classification_id: classification_id)
      new_real_property.real_property_areas.create(area: area)
      find_taxpayer.consolidated_real_properties.each do |consolidated_real_property|
        new_real_property.consolidated_real_properties << consolidated_real_property
      end
    end
  end
end
