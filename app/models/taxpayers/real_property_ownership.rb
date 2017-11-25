module Taxpayers
  class RealPropertyOwnership < ApplicationRecord
    belongs_to :taxpayer
    belongs_to :real_property
  end
end
