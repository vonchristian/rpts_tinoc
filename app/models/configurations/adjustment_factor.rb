module Configurations
  class AdjustmentFactor < ApplicationRecord
    validates :name, :percent, presence: true
    validates :percent, numericality: true
    validates :name, uniqueness: true
    def name_and_percent
      "#{name} (#{percent})"
    end
  end
end
