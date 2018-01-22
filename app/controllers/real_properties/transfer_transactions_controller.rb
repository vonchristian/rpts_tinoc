module RealProperties
  class TransferTransactionsController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
    end
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @transfer = Transactions::TransferTransactionForm.new
    end
     def create
      @real_property = RealProperty.find(params[:real_property_id])
      @transfer = Transactions::TransferTransactionForm.new(transfer_transaction_params)
      if @transfer.valid?
        @transfer.transfer_property!
        @transfer.create_activity(owner: current_owner)
        redirect_to real_property_url(@real_property), notice: "Transfer saved successfully."
      else
        render :new
      end
    end

    private
    def transfer_transaction_params
      params.require(:transactions_transfer_transaction_form).permit(:grantor_id, :grantee_id, :transferred_real_property_id, :remarks, :date_transferred)
    end
  end
end
