class RealProperty < ApplicationRecord
  enum taxability: [:taxable, :exempted]
  belongs_to :classification, class_name: "Configurations::Classification"
  belongs_to :sub_classification, class_name: "Configurations::SubClassification"
  belongs_to :subdivided_real_property, class_name: "RealProperty", foreign_key: 'subdivided_real_property_id'
  has_one :location
  has_many :market_value_adjustments
  has_many :real_property_ownerships, class_name: "Taxpayers::RealPropertyOwnership"
  has_many :property_administrations, class_name: "RealProperties::PropertyAdministration"
  has_many :property_owners, through: :real_property_ownerships, source: :property_owner, source_type: 'Taxpayer'

  ##Transactions
  has_one :transfer_transaction, foreign_key: 'old_real_property_id', class_name: "Transactions::TransferTransaction"
  has_many :revisions, class_name: "Transactions::Revision"
  has_many :real_property_consolidations, class_name: "RealProperties::RealPropertyConsolidation"
  has_many :subdivided_real_properties, class_name: 'RealProperty', foreign_key: 'subdivided_real_property_id'

  has_many :assessed_real_properties
  has_many :previous_real_properties, foreign_key: 'latest_real_property_id', class_name: "PreviousRealProperty"

  has_many :appraisals
  has_many :property_boundaries
  ##Boundaries
  has_many :north_property_boundaries, class_name: "RealProperties::Boundaries::NorthPropertyBoundary"
  has_many :south_property_boundaries, class_name: "RealProperties::Boundaries::SouthPropertyBoundary"
  has_many :east_property_boundaries, class_name: "RealProperties::Boundaries::EastPropertyBoundary"
  has_many :west_property_boundaries, class_name: "RealProperties::Boundaries::WestPropertyBoundary"

  has_many :buildings, class_name: "RealProperties::PropertyTypes::Building", foreign_key: 'land_reference_id'

  has_many :encumberances

  delegate :name, to: :current_owner, prefix: true, allow_nil: true
  delegate :market_value, to: :sub_classification, prefix: true
  delegate :assessment_level, to: :classification, prefix: true

  def assessed_value
    adjusted_market_value * classification_assessment_level
  end

  def adjusted_market_value
    market_value + market_value_adjustments.total
  end
  def market_value
    area * sub_classification_market_value
  end

  def self.types
    ["RealProperties::PropertyTypes::Land"]
  end
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
