module Locations
  class Street < ApplicationRecord
    belongs_to :barangay
    has_many :locations
    has_many :real_properties, through: :locations
    validates :name, presence: true, uniqueness: { scope: :barangay_id }
    validates :barangay_id, presence: true

  end
end
