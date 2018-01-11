module RealProperties
  class RealPropertyAreasController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @area = RealProperties::RealPropertyAreaForm.new
    end
    def create
       @real_property = RealProperty.find(params[:real_property_id])
      @area = RealProperties::RealPropertyAreaForm.new(area_params)
      if @area.valid?
        @area.save
        redirect_to real_property_settings_url(@real_property), notice: "Area updated successfully."
      else
        render :new
      end
    end

    private
    def area_params
      params.require(:real_properties_real_property_area_form).permit(:area, :effectivity_date, :remarks, :real_property_id)
    end
  end
end
