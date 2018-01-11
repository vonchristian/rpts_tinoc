module Settings
  module Classifications
    class AssessmentLevelsController < ApplicationController
      def new
        @classification = Configurations::Classification.find(params[:classification_id])
        @assessment_level = @classification.assessment_levels.build
      end
      def create
        @classification = Configurations::Classification.find(params[:classification_id])
        @assessment_level = @classification.assessment_levels.create(assessment_level_params)
        if @assessment_level.save
          redirect_to settings_classification_url(@classification), notice: "Assessment Level created successfully."
        else
          render :new
        end
      end

      private
      def assessment_level_params
        params.require(:assessment_level).permit(:percent, :effectivity_date)
      end
    end
  end
end

