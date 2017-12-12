class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :street
  belongs_to :barangay
  belongs_to :municipality
end
