module RealProperties
  class SubdivisionTransactionsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @subdivision = Transactions::SubdivisionTransactionForm.new
    end
    def create
      @real_property = RealProperty.find(params[:real_property_id])
      @subdivision = Transactions::SubdivisionTransactionForm.new(subdivision_params)
      if @subdivision.valid?
        @subdivision.subdivide!
        redirect_to real_property_url(@real_property), notice: "Subdivision saved successfully"
        # PreviousRealProperty.add_previous_real_properties(@real_property, @subdivision.real_property)
      else
        render :new
      end
    end
    private
    def subdivision_params
      params.require(:transactions_subdivision_transaction_form).permit(:divided_real_property_id, :area, :date, :sub_classification_id, :classification_id, :description)
    end
  end
end
