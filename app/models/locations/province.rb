module Locations
  class Province < ApplicationRecord
    has_many :municipalities, class_name: "Locations::Municipality"
    validates :name, presence: true, uniqueness: true
  end
end
