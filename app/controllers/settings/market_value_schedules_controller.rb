module Settings
  class MarketValueSchedulesController < ApplicationController
    def new
      @sub_classification = Configurations::SubClassification.find(params[:sub_classification_id])
      @market_value = @sub_classification.market_value_schedules.build
    end
    def create
      @sub_classification = Configurations::SubClassification.find(params[:sub_classification_id])
      @market_value = @sub_classification.market_value_schedules.create(market_value_params)
      if @market_value.save
        redirect_to settings_sub_classification_url(@sub_classification), notice: "Market Value created successfully."
      else
        render :new
      end
    end

    private
    def market_value_params
      params.require(:configurations_market_value_schedule).permit(:market_value, :effectivity_date, :unit, :municipality_id)
    end
  end
end
