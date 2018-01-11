module Configurations
  class MarketValue < ApplicationRecord
    belongs_to :sub_classification, class_name: "Configurations::SubClassification"
  end
end
