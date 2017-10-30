class Taxpayer < ApplicationRecord
  has_many :taxpayer_real_properties, class_name: "Taxpayers::TaxpayerRealProperty"
  has_many :real_properties, through: :taxpayer_real_properties
end
