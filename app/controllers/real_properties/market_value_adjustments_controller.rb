module RealProperties
  class MarketValueAdjustmentsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @adjustment = RealProperties::MarketValueAdjustmentForm.new
    end
    def create
       @real_property = RealProperty.find(params[:real_property_id])
      @adjustment = RealProperties::MarketValueAdjustmentForm.new(adjustment_params)
      if @adjustment.valid?
        @adjustment.save
        redirect_to new_real_property_market_value_adjustment_url(@real_property), notice: "Market Value Adjustment added successfully."
      else
        render :new
      end
    end

    private
    def adjustment_params
      params.require(:real_properties_market_value_adjustment_form).permit(:adjustment_factor_id, :effectivity_date, :real_property_id, :remarks)
    end
  end
end
