class ConsolidationsController < ApplicationController
  def show
    @consolidation = Consolidation.find(params[:id])
  end
end
