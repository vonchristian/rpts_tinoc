module Transactions
  class TransferTransactionForm
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :grantor_id, :grantee_id, :remarks, :transferred_real_property_id, :date_transferred

    def transfer_property!
      ActiveRecord::Base.transaction do
        save_transfer
      end
    end

    private
    def save_transfer
      find_real_property.transfer_transactions.create(grantor_id: grantor_id, grantee_id: grantee_id, remarks: remarks, date_transferred: date_transferred)
    end

    def find_real_property
      RealProperty.find_by_id(transferred_real_property_id)
    end
  end
end
