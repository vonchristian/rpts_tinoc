class Taxpayer < ApplicationRecord
  has_many :taxpayer_real_properties, class_name: "Taxpayers::TaxpayerRealProperty"
  has_many :real_properties, through: :taxpayer_real_properties
  has_many :received_real_properties, class_name: "TransferTransaction", foreign_key: 'new_owner_id'
  has_many :transferred_real_properties, class_name: "TransferTransaction", foreign_key: 'previous_owner_id'

  def first_and_last_name
    "#{first_name} #{last_name}"
  end
end
