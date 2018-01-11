module RealProperties
  class ClassificationsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @real_property_classification = @real_property.real_property_classifications.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @real_property_classification = @real_property.real_property_classifications.build
      @real_property_classification.update(real_property_classification_params)
      if @real_property_classification.save
        redirect_to real_property_settings_url(@real_property), notice: "Classification updated successfully."
      else
        render :edit
      end
    end

    private
    def real_property_classification_params
      params.require(:real_properties_real_property_classification).permit(:classification_id)
    end
  end
end
