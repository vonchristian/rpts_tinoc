module RealProperties
  class TransferTransactionsController < ApplicationController
    def new
      @real_property = RealProperty.find(params[:real_property_id])
      @transfer = @real_property.build_transfer_transaction
      @transfer.build_new_real_property
    end
     def create
      @real_property = RealProperty.find(params[:real_property_id])
      @transfer = @real_property.create_transfer_transaction(transfer_transaction_params)
      if @transfer.valid?
        @transfer.save
        redirect_to real_property_url(@transfer.new_real_property), notice: "Transfer saved successfully."
         @transfer.new_real_property.assessed_real_properties << @real_property.assessed_real_properties

      else
        render :new
      end
    end

    private
    def transfer_transaction_params
      params.require(:transactions_transfer_transaction).permit(:new_owner_id, :old_real_property_id,:date_transferred, new_real_property_attributes: [:description] )
    end
  end
end
