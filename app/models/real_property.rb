class RealProperty < ApplicationRecord
  include PublicActivity::Common
  enum taxability: [:taxable, :exempted]
  has_one :subdivision_transaction, class_name: "Transactions::Subdivision", foreign_key: 'real_property_id'

  has_one :location
  has_many :real_property_areas, class_name: "RealProperties::RealPropertyArea"
  has_many :market_value_adjustments, class_name: "RealProperties::MarketValueAdjustment"
  has_many :real_property_ownerships, class_name: "Taxpayers::RealPropertyOwnership"
  has_many :property_administrations, class_name: "RealProperties::PropertyAdministration"
  has_many :property_owners, through: :real_property_ownerships, source: :property_owner, source_type: 'Taxpayer'

  ##Transactions
  has_many :transfer_transactions, foreign_key: 'transferred_real_property_id', class_name: "Transactions::TransferTransaction"

  has_many :real_property_consolidations, class_name: "RealProperties::RealPropertyConsolidation"
  has_many :consolidated_real_properties, class_name: "RealProperty", foreign_key: 'consolidated_real_property_id'
  has_many :subdivision_transactions, class_name: "Transactions::Subdivision", foreign_key: 'divided_real_property_id'
  has_many :subdivided_real_properties, class_name: 'RealProperty', through: :subdivision_transactions, source: :real_property

  has_many :assessed_real_properties, class_name: "RealProperties::AssessedRealProperty"
  has_many :previous_real_properties, foreign_key: 'latest_real_property_id', class_name: "PreviousRealProperty"

  has_many :property_boundaries, class_name: "RealProperties::PropertyBoundary"
  ##Boundaries
  has_many :north_property_boundaries, class_name: "RealProperties::Boundaries::NorthPropertyBoundary"
  has_many :south_property_boundaries, class_name: "RealProperties::Boundaries::SouthPropertyBoundary"
  has_many :east_property_boundaries, class_name: "RealProperties::Boundaries::EastPropertyBoundary"
  has_many :west_property_boundaries, class_name: "RealProperties::Boundaries::WestPropertyBoundary"

  has_many :buildings, class_name: "RealProperties::PropertyTypes::Building", foreign_key: 'land_reference_id'

  has_many :encumberances, class_name: "RealProperties::Encumberance"
  has_many :revisions
  has_many :real_property_classifications, class_name: "RealProperties::RealPropertyClassification"
  has_many :classifications, through: :real_property_classifications, class_name: "Configurations::Classification"

  has_many :real_property_sub_classifications, class_name: "RealProperties::RealPropertySubClassification"
  has_many :sub_classifications, through: :real_property_sub_classifications, class_name: "Configurations::SubClassification"
  has_many :assessed_values, class_name: "RealProperties::AssessedValue"
  delegate :name, to: :current_owner, prefix: true, allow_nil: true
  delegate :current_market_value, :name, to: :current_sub_classification, prefix: true, allow_nil: true
  delegate :assessment_level, :name, to: :current_classification, prefix: true, allow_nil: true
  delegate :divided_real_property, to: :subdivision_transaction, allow_nil: true
  def current_owners_name
    if transfer_transaction.present?
      transfer_transaction.grantee
    else
      property_owners
    end
  end
  def current_classification
    real_property_classifications.current
  end
  def current_sub_classification
    real_property_sub_classifications.current
  end

  def taxpayers_name
    property_owners.map{|a| a.name }.join(",")
  end
  def assessed_value
    assessed_values.current
  end

  def temp_assessed_value
    adjusted_market_value * current_classification_assessment_level
  end

  def adjusted_market_value
    market_value + market_value_adjustments.total
  end
  def market_value
    MarketValueComputation.new.compute(self)
  end

  def current_area
    real_property_areas.current
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
    assessed_real_properties.order(created_at: :asc).last.try(:number)
  end
  def previous_arps
    if transfer_transaction
      previous_real_property.current_arp
    end
  end
  def current_owner

  end
end
