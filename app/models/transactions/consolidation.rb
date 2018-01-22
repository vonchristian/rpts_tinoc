module Transactions
  class Consolidation < ApplicationRecord
    belongs_to :consolidator, polymorphic: true
    belongs_to :real_property
    belongs_to :consolidated_real_property, class_name: "RealProperty", foreign_key: 'consolidated_real_property_id'
    validates :consolidated_real_property_id, uniqueness: { scope: :consolidator_id }
  end
end
