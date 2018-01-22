class Taxpayer < ApplicationRecord
  has_one :tin, as: :tinable
  has_many :real_property_ownerships, class_name: "Taxpayers::RealPropertyOwnership", as: :property_owner
  has_many :real_properties, through: :real_property_ownerships
  has_many :received_transferred_real_properties, class_name: "Transactions::TransferTransaction", foreign_key: 'grantee_id'
  has_many :real_property_consolidations, foreign_key: 'consolidator_id', class_name: "RealProperties::RealPropertyConsolidation"
  has_many :consolidation_transactions, class_name: "Transactions::Consolidation", as: :consolidator
  has_many :consolidated_real_properties, through: :consolidation_transactions
  has_many :consolidations, foreign_key: 'consolidator_id', class_name: "Transactions::Consolidation"
  has_many :property_administrations, class_name: "RealProperties::PropertyAdministration", as: :administrator
  def first_and_last_name
    "#{first_name} #{last_name}"
  end
  def name
    first_and_last_name
  end
end
