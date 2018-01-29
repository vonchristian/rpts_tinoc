module Settings
  class MunicipalitiesController < ApplicationController
    def new
      @municipality = Locations::Municipality.new
    end
    def create
      @municipality = Locations::Municipality.create(municipality_params)
      if @municipality.valid?
        @municipality.save
        redirect_to settings_url, notice: "Saved successfully"
      else
        render :new
      end
    end

    private
    def municipality_params
      params.require(:locations_municipality).permit(:province_id, :name, :code)
    end
  end
end
