class RealProperty < ApplicationRecord
  has_many :taxpayer_real_properties, class_name: "Taxpayers::TaxpayerRealProperty"
  has_many :taxpayers, through: :taxpayer_real_properties
  has_many :revisions
  has_many :tax_declarations
  accepts_nested_attributes_for :tax_declarations

end
