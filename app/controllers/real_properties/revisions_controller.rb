module RealProperties
  class RevisionsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @revision = @real_property.revisions.build
    end
    def create
       @real_property = RealProperty.find(params[:real_property_id])
      @revision = @real_property.revisions.create(revision_params)
      if @revision.save
        redirect_to @real_property, notice: "Revision saved successfully"
      else
        render :new
      end
    end

    private
    def revision_params
      params.require(:revision).permit(:date)
    end
  end
end
