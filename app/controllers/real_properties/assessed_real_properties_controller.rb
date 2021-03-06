module RealProperties
  class AssessedRealPropertiesController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @assessed_real_property = @real_property.assessed_real_properties.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @assessed_real_property = @real_property.assessed_real_properties.create(assessed_real_property_params)
      if @assessed_real_property.valid?
        @assessed_real_property.save
        redirect_to real_property_arps_url(@real_property), notice: "ARP saved successfully"
      else
        render :new
      end
    end

    private
    def assessed_real_property_params
      params.require(:real_properties_assessed_real_property).permit(:number, :effectivity_date, :municipality_id, :barangay_id)
    end
  end
end
