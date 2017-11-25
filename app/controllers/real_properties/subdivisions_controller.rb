module RealProperties
  class SubdivisionsController < ApplicationController
    def new
       @real_property = RealProperty.find(params[:real_property_id])
       @subdivision = @real_property.subdivided_real_properties.build
       @subdivision.taxpayer_real_properties.build
     end
     def create
      @real_property = RealProperty.find(params[:real_property_id])
      @subdivision = @real_property.subdivided_real_properties.create(subdivision_params)
      if @subdivision.valid?
        @subdivision.save
        redirect_to new_real_property_subdivision_url(@real_property), notice: "saved successfully"
      else
        render :new
      end
    end

    private
    def subdivision_params
      params.require(:real_property).permit(:description, taxpayer_real_properties_attributes: [:taxpayer_id])
    end
  end
end
