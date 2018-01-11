module Settings
  class MarketValuesController < ApplicationController
    def new
      @sub_classification = Configurations::SubClassification.find(params[:sub_classification_id])
      @market_value = @sub_classification.market_values.build
    end
    def create
      @sub_classification = Configurations::SubClassification.find(params[:sub_classification_id])
      @market_value = @sub_classification.market_values.create(market_value_params)
      if @market_value.save
        redirect_to settings_sub_classification_url(@sub_classification), notice: "Market Value created successfully."
      else
        render :new
      end
    end

    private
    def market_value_params
      params.require(:configurations_market_value).permit(:market_value, :effectivity_date, :unit)
    end
  end
end
