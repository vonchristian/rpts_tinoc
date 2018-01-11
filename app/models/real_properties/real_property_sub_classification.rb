module RealProperties
  class RealPropertySubClassification < ApplicationRecord
    belongs_to :real_property, touch: true
    belongs_to :sub_classification, class_name: "Configurations::SubClassification"
    delegate :current_market_value, :name, to: :sub_classification
    def self.current
      order(effectivity_date: :asc).last
    end
  end
end
