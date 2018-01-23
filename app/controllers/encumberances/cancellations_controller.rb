module Encumberances
  class CancellationsController < ApplicationController
    def create
      @encumberance = RealProperties::Encumberance.find(params[:encumberance_id])
      @encumberance.cancel!
      redirect_to real_property_encumberances_url(@encumberance.real_property), notice: "Encumberance cancelled successfully."
    end
  end
end
