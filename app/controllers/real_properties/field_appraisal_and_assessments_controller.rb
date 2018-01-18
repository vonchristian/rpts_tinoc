module RealProperties
  class FieldAppraisalAndAssessmentsController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
      respond_to do |format|
        format.pdf do
          pdf = RealProperties::FieldAppraisalAndAssessmentPdf.new(@real_property, view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Field Appraisal and Asssessment.pdf"
        end
      end
    end
  end
end
