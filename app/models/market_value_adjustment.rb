class MarketValueAdjustment < ApplicationRecord
  belongs_to :real_property
  belongs_to :adjustment_factor
  delegate :name, :percent, to: :adjustment_factor
  def self.total
    sum(&:value_adjustment)
  end

  def value_adjustment
    real_property.market_value * percent
  end
end
