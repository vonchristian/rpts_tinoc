module RealProperties
  class RealPropertyAreaForm
    include ActiveModel::Model
    include ActiveModel::Callbacks
    attr_accessor :area, :remarks, :effectivity_date, :real_property_id
    validates :area, presence: true, numericality: { greater_than: 0 }
    def save
      ActiveRecord::Base.transaction do
        create_area_and_revisions
      end
    end

    private
    def find_real_property
      RealProperty.find_by_id(real_property_id)
    end
    def create_area_and_revisions
      revised_area = find_real_property.real_property_areas.create(effectivity_date: effectivity_date, area: area)
      find_real_property.revisions.create(effectivity_date: effectivity_date, revised_data: revised_area, remarks: remarks)
    end
  end
end
