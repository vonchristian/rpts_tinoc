module Transactions
  class TransferTransaction < ApplicationRecord
    belongs_to :new_owner, class_name: "Taxpayer", foreign_key: 'new_owner_id'
    belongs_to :old_real_property, class_name: "RealProperty", foreign_key: 'old_real_property_id'
    belongs_to :new_real_property, class_name: "RealProperty", foreign_key: 'new_real_property_id'


    validates :date_transferred, presence: true
    validates :old_real_property_id, presence: true
    delegate :description, to: :old_real_property, prefix: true
    accepts_nested_attributes_for :new_real_property
    after_commit :add_previous_real_properties

    private
    def add_previous_real_properties
      PreviousRealProperty.add_previous_real_properties(self.old_real_property, self.new_real_property)
    end
  end
end
