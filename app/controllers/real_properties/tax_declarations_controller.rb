module RealProperties
  class TaxDeclarationsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @tax_declaration = @real_property.tax_declarations.build
    end
    def create
       @real_property = RealProperty.find(params[:real_property_id])
      @tax_declaration = @real_property.tax_declarations.create(tax_declaration_params)
      if @tax_declaration.save
        redirect_to @real_property, notice: "Tax Declaration saved successfully"
      else
        render :new
      end
    end

    private
    def tax_declaration_params
      params.require(:tax_declaration).permit(:number)
    end
  end
end
