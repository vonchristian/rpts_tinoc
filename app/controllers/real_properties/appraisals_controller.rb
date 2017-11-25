module RealProperties
  class AppraisalsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @appraisal = @real_property.appraisals.build
    end

    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @appraisal = @real_property.appraisals.create(appraisal_params)
      if @appraisal.valid?
        @appraisal.save
        redirect_to @real_property, notice: "Appraisal saved successfully"
      else
        render :new
      end
    end

    private
    def appraisal_params
      params.require(:appraisal).permit(:classification_id, :sub_classification_id, :unit_value, :market_value)
    end
  end
end
