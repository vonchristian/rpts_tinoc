class MarketValueComputation
  def compute(real_property)
    real_property.current_area * real_property.current_sub_classification_current_market_value
  end
end
