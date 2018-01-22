module Transactions
  class SubdivisionTransactionForm
    include ActiveModel::Model
    include ActiveModel::Validations
    attr_accessor :divided_real_property_id, :area, :date, :sub_classification_id, :classification_id, :description, :area, :type

    def subdivide!
      ActiveRecord::Base.transaction do
        save_subdivision
      end
    end

    def save_subdivision
      new_real_property = find_real_property.subdivided_real_properties.create(description: description, type: type)
      new_real_property.real_property_sub_classifications.create(sub_classification_id: sub_classification_id)
      new_real_property.real_property_classifications.create(classification_id: classification_id)
      new_real_property.real_property_areas.create(area: area)
    end
    def find_real_property
      RealProperty.find_by_id(divided_real_property_id)
    end
  end
end
