module RealProperties
  class MarketValueAdjustmentForm
    include ActiveModel::Model
    include ActiveModel::Callbacks
    attr_accessor :real_property_id, :adjustment_factor_id, :effectivity_date, :remarks

    def save
      ActiveRecord::Base.transaction do
        create_market_value_adjustment
      end
    end

    private
    def find_real_property
      RealProperty.find_by_id(real_property_id)
    end

    def create_market_value_adjustment
      revised_data = find_real_property.market_value_adjustments.find_or_create_by(adjustment_factor_id: adjustment_factor_id)
      find_real_property.revisions.create(effectivity_date: effectivity_date, revised_data: revised_data, remarks: remarks)
    end
  end
end
