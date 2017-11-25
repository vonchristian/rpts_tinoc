module Locations
  class Barangay < ApplicationRecord
    belongs_to :municipality
  end
end
