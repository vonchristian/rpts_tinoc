module Locations
  class Barangay < ApplicationRecord
    belongs_to :municipality
    validates :name, presence: true, uniqueness: { scope: :municipality_id }
    validates :municipality_id, presence: true
  end
end
