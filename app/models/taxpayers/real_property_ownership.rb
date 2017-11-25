module Taxpayers
  class RealPropertyOwnership < ApplicationRecord
    belongs_to :property_owner, polymorphic: true
    belongs_to :real_property
  end
end
