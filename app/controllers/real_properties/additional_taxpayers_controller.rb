module RealProperties
  class AdditionalTaxpayersController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @additional_taxpayer = @real_property.taxpayer_real_properties.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @additional_taxpayer = @real_property.taxpayer_real_properties.create(additional_taxpayer_params)
      @additional_taxpayer.save
      redirect_to new_real_property_additional_taxpayer_url(@real_property), notice: 'added successfully'
    end

    private
    def additional_taxpayer_params
      params.require(:taxpayers_taxpayer_real_property).permit(:taxpayer_id)
    end
  end
end
