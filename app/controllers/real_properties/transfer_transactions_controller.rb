module RealProperties
  class TransferTransactionsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @transfer = @real_property.transfer_transactions.build
    end
     def create
      @real_property = RealProperty.find(params[:real_property_id])
      @transfer = @real_property.transfer_transactions.create(transfer_transaction_params)
      if @transfer.valid?
        @transfer.save
        redirect_to @real_property, notice: "Transfer saved successfully."
      else
        render :new
      end
    end

    private
    def transfer_transaction_params
      params.require(:transfer_transaction).permit(:new_owner_id, :date_transferred)
    end
  end
end
