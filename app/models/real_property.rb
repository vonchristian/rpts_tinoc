class RealProperty < ApplicationRecord
  belongs_to :subdivided_real_property, class_name: "RealProperty", foreign_key: 'subdivided_real_property_id'

  has_one :transfer_transaction, foreign_key: 'old_real_property_id', class_name: "Transactions::TransferTransaction"
  has_one :location
  has_many :real_property_ownerships, class_name: "Taxpayers::RealPropertyOwnership"
  has_many :taxpayer_property_owners, through: :real_property_ownerships, source: :property_owner, source_type: 'Taxpayer'
  has_many :revisions, class_name: "Transactions::Revision"
  has_many :tax_declarations
  has_many :assessed_real_properties
  has_many :real_property_consolidations, class_name: "RealProperties::RealPropertyConsolidation"
  has_many :subdivided_real_properties, class_name: 'RealProperty', foreign_key: 'subdivided_real_property_id'
  has_many :previous_real_properties, foreign_key: 'latest_real_property_id', class_name: "PreviousRealProperty"

  has_many :appraisals

  delegate :name, to: :current_owner, prefix: true, allow_nil: true

  accepts_nested_attributes_for :tax_declarations
  accepts_nested_attributes_for :real_property_ownerships

  def latest_real_property
    PreviousRealProperty.latest_for(self)
  end
  def previous_real_property
    prev = TransferTransaction.where(new_real_property: self).last
    if prev
      prev.old_real_property
    end
  end
  def current_arp
    assessed_real_properties.order(created_at: :asc).last
  end
  def previous_arps
    if transfer_transaction
      previous_real_property.current_arp
    end
  end
  def current_owner

  end
end
