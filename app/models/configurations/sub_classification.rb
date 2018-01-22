module Configurations
  class SubClassification < ApplicationRecord
    belongs_to :classification, class_name: "Configurations::Classification"
    has_many :market_value_schedules
    validates :name, presence: true, uniqueness: true
    def current_market_value
      market_value_schedules.order(effectivity_date: :asc).last.try(:market_value)
    end
  end
end
