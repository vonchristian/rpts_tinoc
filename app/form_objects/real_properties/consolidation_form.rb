module RealProperties
  class ConsolidationForm
    include ActiveModel::Model
    attr_accessor :taxpayer_id, :date, :real_property_id

    def save
      ActiveRecord::Base.transaction do
        create_or_find_consolidation
      end
    end

    def find_consolidation
      Consolidation.find_by(consolidator_id: taxpayer_id, date: date)
    end

    private
    def create_or_find_consolidation
      consolidation = Consolidation.find_or_create_by(consolidator_id: taxpayer_id, date: date.to_date)
      consolidation.real_property_consolidations.create(real_property_id: real_property_id, consolidator_id: taxpayer_id)
    end
  end
end
