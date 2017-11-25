class Location < ApplicationRecord
  belongs_to :real_property
  belongs_to :street
  belongs_to :barangay
end
