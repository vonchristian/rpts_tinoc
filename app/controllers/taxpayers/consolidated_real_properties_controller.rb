module Taxpayers
  class ConsolidatedRealPropertiesController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @consolidation = @taxpayer.consolidations.build
      @consolidation.build_real_property
    end

    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @consolidation = @taxpayer.consolidations.create(consolidation_params)
      if @consolidation.valid?
        @consolidation.save
        redirect_to consolidation_url(@consolidation)
      else
        render :new
      end
    end

    private
    def consolidation_params
      params.require(:consolidation).permit(real_property_attributes: [:description])
    end
  end
end
