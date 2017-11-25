module Settings
  class ClassificationsController < ApplicationController
    def new
      @classification = Configurations::Classification.new
    end
    def create
      @classification = Configurations::Classification.create(classification_params)
      if @classification.valid?
        @classification.save
        redirect_to settings_url, notice: 'saved successfully'
      else
        render :new
      end
    end
    def show
      @classification = Configurations::Classification.find(params[:id])
    end

    private
    def classification_params
      params.require(:configurations_classification).permit(:name)
    end
  end
end
