module Locations
  class Municipality < ApplicationRecord
    belongs_to :province
    validates :name, presence: true, uniqueness: { scope: :province_id }
    validates :province_id, presence: true
  end
end
