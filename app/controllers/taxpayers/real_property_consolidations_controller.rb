module Taxpayers
  class RealPropertyConsolidationsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @real_property_consolidation = RealProperties::ConsolidationForm.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @real_property_consolidation = RealProperties::ConsolidationForm.new(consolidation_params)
      if @real_property_consolidation.valid?
        @real_property_consolidation.save
        redirect_to @taxpayer, notice: "Suceess"
      else
        render :new
      end
    end

    private
    def consolidation_params
      params.require(:real_properties_consolidation_form).permit(:consolidator_id, :consolidator_type, :area, :date, :sub_classification_id, :classification_id, :description, :type)
    end
  end
end
