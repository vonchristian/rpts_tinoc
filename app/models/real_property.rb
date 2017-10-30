class RealProperty < ApplicationRecord
  has_many :taxpayer_real_properties, class_name: "Taxpayers::TaxpayerRealProperty"
  has_many :taxpayers, through: :taxpayer_real_properties
end
