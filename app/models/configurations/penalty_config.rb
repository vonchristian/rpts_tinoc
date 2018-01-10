module Configurations
  class PenaltyConfig < ApplicationRecord
    validates :max_no_month, :penalty_rate, presence: true, numericality: true
  end
end
