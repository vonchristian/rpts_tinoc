class RealPropertiesController < ApplicationController
  def index
    @real_properties = RealProperty.all
  end
  def show
    @real_property = RealProperty.find(params[:id])
  end
end
