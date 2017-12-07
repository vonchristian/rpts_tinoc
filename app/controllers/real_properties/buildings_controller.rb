module RealProperties
  class BuildingsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @building = @real_property.buildings.build
      @building.build_building_description
      @building.floors.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @building = @real_property.buildings.create(building_params)
      if @building.save
        redirect_to real_property_url(@real_property), notice: "Building saved successfully"
      else
        render :new
      end
    end

    private
    def building_params
      params.require(:real_properties_building).permit(building_description_attributes:[:kind, :structural_type], floors_attributes: [:area])
    end
  end
end
