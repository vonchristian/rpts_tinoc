module RealProperties
  class PropertyAdministration < ApplicationRecord
    belongs_to :real_property
    belongs_to :administrator, polymorphic: true
  end
end
