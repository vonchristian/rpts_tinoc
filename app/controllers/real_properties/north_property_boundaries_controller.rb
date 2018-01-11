module RealProperties
  class NorthPropertyBoundariesController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @north_property_boundary = @real_property.north_property_boundaries.build
    end

    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @north_property_boundary = @real_property.north_property_boundaries.create(boundary_params)
      if @north_property_boundary.save
        redirect_to real_property_url(@real_property), notice: "saved successfully"
      else
        render :new
      end
    end

    private
    def boundary_params
      params.require(:real_properties_boundaries_north_property_boundary).permit(:remarks)
    end
  end
end
