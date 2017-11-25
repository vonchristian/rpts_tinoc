class Taxpayer < ApplicationRecord
  has_many :real_property_ownerships, class_name: "Taxpayers::RealPropertyOwnership", as: :property_owner
  has_many :real_properties, through: :real_property_ownerships
  has_many :received_transferred_real_properties, class_name: "TransferTransaction", foreign_key: 'new_owner_id'
  has_many :real_property_consolidations, foreign_key: 'consolidator_id', class_name: "RealProperties::RealPropertyConsolidation"
  has_many :consolidations, foreign_key: 'consolidator_id'
  def first_and_last_name
    "#{first_name} #{last_name}"
  end
  def name
    first_and_last_name
  end
end
