module Taxpayers
  class RealPropertiesController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @real_property = RealProperties::RegistrationForm.new
    end

    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @real_property = RealProperties::RegistrationForm.new(real_property_params)
      if @real_property.valid?
        @real_property.save
        redirect_to @taxpayer, notice: "Real Property saved successfully."
      else
        render :new
      end
    end

    private
    def real_property_params
      params.require(:real_properties_registration_form).permit(:sub_classification_id, :classification_id, :taxpayer_id, :description, :area, :type)
    end
  end
end
