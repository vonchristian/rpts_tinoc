module Arps
  class CancellationsController < ApplicationController
    def create
      @arp = RealProperties::AssessedRealProperty.find(params[:arp_id])
      @arp.cancel!
      redirect_to real_property_arps_url(@arp.real_property), notice: "ARP cancelled successfully."
    end
  end
end
