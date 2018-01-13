module RealProperties
  class AssessedValue < ApplicationRecord
    belongs_to :real_property
    belongs_to :assessed_real_property
    def self.current
      order(effectivity_date: :asc).last.try(:assessed_value)
    end
  end
end
