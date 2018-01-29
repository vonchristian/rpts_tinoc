module Settings
  class BarangaysController < ApplicationController
    def new
      @municipality = Locations::Municipality.find(params[:municipality_id])
      @barangay =@municipality.barangays.build
    end
    def create
      @municipality = Locations::Municipality.find(params[:municipality_id])
      @barangay = @municipality.barangays.create(barangay_params)
      if @barangay.valid?
        @barangay.save
        redirect_to municipality_url(@municipality), notice: "Barangay saved successfully"
      else
        render :new
      end
    end

    private
    def barangay_params
      params.require(:locations_barangay).permit(:name, :code)
    end
  end
end
