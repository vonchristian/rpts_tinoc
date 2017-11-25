class RealPropertyConsolidationsController < ApplicationController
  def new
    @consolidation = Consolidation.find(params[:consolidation_id])
    @real_property_consolidation = @consolidation.real_property_consolidations.build
  end
  def create
    @consolidation = Consolidation.find(params[:consolidation_id])
    @real_property_consolidation = @consolidation.real_property_consolidations.create(real_property_consolidation_params)
    @real_property_consolidation.save
    redirect_to new_consolidation_real_property_consolidation_url(@consolidation)
    PreviousRealProperty.add_previous_real_properties(@real_property_consolidation.real_property, @consolidation.real_property)
  end
  private
  def real_property_consolidation_params
    params.require(:real_properties_real_property_consolidation).permit(:real_property_id, :consolidator_id)
  end
end
