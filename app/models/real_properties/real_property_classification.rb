module RealProperties
  class RealPropertyClassification < ApplicationRecord
    belongs_to :real_property
    belongs_to :classification, class_name: "Configurations::Classification"
    delegate :assessment_level, :name, to: :classification
    def self.current
      order(effectivity_date: :asc).last
    end
  end
end
