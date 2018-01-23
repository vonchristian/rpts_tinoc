module RealProperties
  class MarketValueAdjustment < ApplicationRecord
    belongs_to :real_property
    belongs_to :adjustment_factor, class_name: "Configurations::AdjustmentFactor"
    delegate :name, :percent, to: :adjustment_factor
    delegate :market_value, to: :real_property
    def self.total(options={})
      if options[:from_date] && options[:to_date]
        date_range = DateRange.new(from_date: options[:from_date], to_date: options[:to_date])
        where('created_at' => (date_range.start_date..date_range.end_date)).sum(&:value_adjustment)
      else
        sum(&:value_adjustment)
      end
    end

    def value_adjustment
      market_value * percent
    end
  end
end
