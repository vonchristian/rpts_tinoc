class MunicipalitiesController < ApplicationController
  def show
    @municipality = Locations::Municipality.find(params[:id])
  end
end
