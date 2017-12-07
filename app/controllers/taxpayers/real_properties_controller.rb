module Taxpayers
  class RealPropertiesController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @real_property = @taxpayer.real_properties.build
    end

     def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @real_property = @taxpayer.real_properties.create(real_property_params)
      if @real_property.valid?
        @real_property.save
        redirect_to @taxpayer, notice: "Real Property saved successfully."
      else
        render :new
      end
    end

    private
    def real_property_params
      params.require(:real_property).permit(:description, :type)
    end
  end
end
