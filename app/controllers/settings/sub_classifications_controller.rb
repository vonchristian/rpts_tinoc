module Settings
  class SubClassificationsController < ApplicationController
    def new
      @classification = Configurations::Classification.find(params[:classification_id])
      @sub_classification = @classification.sub_classifications.build
    end
    def create
      @classification = Configurations::Classification.find(params[:classification_id])
      @sub_classification = @classification.sub_classifications.build



      if @sub_classification.valid?
        @sub_classification.save
        redirect_to new_settings_classification_sub_classification_url(@classification), notice: 'saved successfully'
      else
        render :new
      end
    end

    private
    def classification_params
      params.require(:configurations_sub_classification).permit(:name)
    end
  end
end
