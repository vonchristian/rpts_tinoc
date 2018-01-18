module RealProperties
  class ReportsController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
    end
  end
end
