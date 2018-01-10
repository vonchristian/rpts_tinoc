module RealProperties
  class PropertyBoundary < ApplicationRecord
    belongs_to :real_property
    def self.current
      order(created_at: :asc).last
    end
  end
end
