class MarketValueComputation
  def compute(real_property)
    if real_property.previous_transferred_real_property.present?
      real_property.previous_transferred_real_property.current_area * real_property.previous_transferred_real_property.current_sub_classification_current_market_value
    else
      real_property.current_area * real_property.current_sub_classification_current_market_value
    end
  end
end
