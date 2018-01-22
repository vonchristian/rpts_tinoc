module Transactions
  class TransferTransaction < ApplicationRecord
    belongs_to :grantee, class_name: "Taxpayer", foreign_key: 'grantee_id' #Buyer
    belongs_to :grantor, class_name: "Taxpayer", foreign_key: 'grantor_id' #Seller
    belongs_to :transferred_real_property, class_name: "RealProperty", foreign_key: 'transferred_real_property_id'

    validates :date_transferred, presence: true
    validates :transferred_real_property_id, presence: true
  end
end
