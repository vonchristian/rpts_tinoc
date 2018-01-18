module RealProperties
  class FieldAppraisalAndAssessmentPdf < Prawn::Document
    def initialize(real_property, view_context)
      super(margin: 20, page_size: 'A4', page_layout: :portrait)
      @real_property = real_property
      @view_context = view_context
      heading
    end
    private
    def heading
      text "REAL PROPERTY FIELD APPRAISAL AND ASSESSMENT SHEET - #{@real_property.type.upcase}", align: :center, style: :bold
      text "#{@real_property.assessed_value.to_f.to_words.titleize} Pesos"
      text "ARP #{@real_property.current_arp}"
      text "Market Value: #{@real_property.market_value}"

    end
  end
end
