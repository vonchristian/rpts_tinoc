class Consolidation < ApplicationRecord
  belongs_to :consolidator, class_name: "Taxpayer", foreign_key: 'consolidator_id'
  belongs_to :real_property
  has_many :real_property_consolidations, class_name: "RealProperties::RealPropertyConsolidation"
  has_many :real_properties, through: :real_property_consolidations,  class_name: "RealProperty"

  accepts_nested_attributes_for :real_property

end
