module RealProperties
  class AdditionalTaxpayersController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @additional_taxpayer = @real_property.real_property_ownerships.build
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @additional_taxpayer = @real_property.real_property_ownerships.create(additional_taxpayer_params)
      @additional_taxpayer.save
      redirect_to new_real_property_additional_taxpayer_url(@real_property), notice: 'added successfully'
    end

    private
    def additional_taxpayer_params
      params.require(:taxpayers_real_property_ownership).permit(:property_owner_id, :property_owner_type)
    end
  end
end
