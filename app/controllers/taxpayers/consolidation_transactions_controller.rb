module Taxpayers
  class ConsolidationTransactionsController < ApplicationController
    def new
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @consolidation_transaction = Transactions::ConsolidationForm.new
    end
    def create
      @taxpayer = Taxpayer.find(params[:taxpayer_id])
      @consolidation_transaction = Transactions::ConsolidationForm.new(consolidation_params)
      if @consolidation_transaction.valid?
        @consolidation_transaction.consolidate!
        redirect_to new_taxpayer_consolidation_transaction_url(@taxpayer), notice: "Added successfully."
      else
        render :new
      end
    end

    private
    def consolidation_params
      params.require(:transactions_consolidation_form).permit(:consolidated_real_property_id, :consolidator_id, :consolidator_type)
    end
  end
end
