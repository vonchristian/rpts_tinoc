module RealProperties
  class ArpsController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
      @arps = @real_property.assessed_real_properties.order(effectivity_date: :desc).all
    end
  end
end
