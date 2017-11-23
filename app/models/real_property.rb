class RealProperty < ApplicationRecord
  has_many :taxpayer_real_properties, class_name: "Taxpayers::TaxpayerRealProperty"
  has_many :taxpayers, through: :taxpayer_real_properties
  has_many :revisions
  has_many :tax_declarations
  has_many :assessed_real_properties
  has_many :transfer_transactions
  accepts_nested_attributes_for :tax_declarations

  def current_arp
    assessed_real_properties.order(created_at: :asc).last
  end
  def current_owner
    if transfer_transactions.blank?
      taxpayers
    elsif
      transfer_transactions.present?
      transfer_transactions.order(created_at: :asc).last.new_owner
    end
  end
end
