module Configurations
  class Classification < ApplicationRecord
    has_many :assessment_levels
    has_many :sub_classifications, class_name: "Configurations::SubClassification"
    def assessment_level
      assessment_levels.order(effectivity_date: :asc).last.percent
    end
  end
end
