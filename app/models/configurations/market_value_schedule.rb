module Configurations
  class MarketValueSchedule < ApplicationRecord
    belongs_to :sub_classification
    belongs_to :municipality
  end
end
