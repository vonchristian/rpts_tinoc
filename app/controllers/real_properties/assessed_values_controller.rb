module RealProperties
  class AssessedValuesController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @assessed_value = @real_property.assessed_values.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @assessed_value = @real_property.assessed_values.create(assessed_value_params)
      if @assessed_value.valid?
        @assessed_value.save
        redirect_to real_property_settings_url(@real_property), notice: "Assessed Value saved successfully."
      else
        render :new
      end
    end

    private
    def assessed_value_params
      params.require(:real_properties_assessed_value).permit(:effectivity_date, :assessed_value, :assessed_real_property_id)
    end
  end
end
