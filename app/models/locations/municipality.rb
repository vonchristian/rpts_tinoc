module Locations
  class Municipality < ApplicationRecord
    belongs_to :province
    has_many :barangays, class_name: "Locations::Barangay"
    validates :name, presence: true, uniqueness: { scope: :province_id }
    validates :province_id, presence: true
  end
end
