module RealProperties
  class TaxationsController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
      @taxations = @real_property.taxations
    end
  end
end
