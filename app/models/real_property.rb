class RealProperty < ApplicationRecord
  has_many :real_property_ownerships, class_name: "Taxpayers::RealPropertyOwnership"
  has_many :taxpayers, through: :real_property_ownerships
  has_many :revisions
  has_many :tax_declarations
  has_many :assessed_real_properties
  has_many :transfer_transactions, foreign_key: 'old_real_property_id'
  has_many :real_property_consolidations #ARP
  delegate :name, to: :current_owner, prefix: true
  accepts_nested_attributes_for :tax_declarations
  belongs_to :subdivided_real_property, class_name: "RealProperty", foreign_key: 'subdivided_real_property_id'
  has_many :subdivided_real_properties, class_name: 'RealProperty', foreign_key: 'subdivided_real_property_id'
  accepts_nested_attributes_for :real_property_ownerships

  def current_arp
    assessed_real_properties.order(created_at: :asc).last
  end

  def current_owner
    if  transfer_transactions.present?
      transfer_transactions.order(created_at: :asc).last.new_owner
    elsif real_property_consolidations.present?
      real_property_consolidations.order(created_at: :asc).last.consolidator
    elsif subdivided_real_properties.present?
      subdivided_real_properties.order(:created_at => :asc).last.taxpayer
    else
      taxpayers
    end
  end
end
