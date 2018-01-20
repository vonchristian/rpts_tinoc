module RealProperties
  class MarketValueAdjustment < ApplicationRecord
    belongs_to :real_property
    belongs_to :adjustment_factor, class_name: "Configurations::AdjustmentFactor"
    delegate :name, :percent, to: :adjustment_factor
    def self.total(options={})
      if options[:from_date] && options[:to_date]
        from_date = options[:from_date].kind_of?(DateTime) ? options[:from_date] : Chronic.parse(options[:from_date].strftime('%Y-%m-%d 12:00:00'))
        to_date = options[:to_date].kind_of?(DateTime) ? options[:to_date] : Chronic.parse(options[:to_date].strftime('%Y-%m-%d 12:59:59'))
        where('created_at' => (from_date.yesterday.end_of_day)..(to_date.end_of_day)).sum(&:value_adjustment)
      else
        sum(&:value_adjustment)
      end
    end

    def value_adjustment
      real_property.market_value * percent
    end
  end
end