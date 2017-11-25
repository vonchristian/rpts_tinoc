class RealPropertyConsolidation < ApplicationRecord
  belongs_to :real_property
  belongs_to :consolidation
  belongs_to :consolidator, class_name: "Taxpayer", foreign_key: 'consolidator_id'
end
