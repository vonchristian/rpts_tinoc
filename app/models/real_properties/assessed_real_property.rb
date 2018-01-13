module RealProperties
  class AssessedRealProperty < ApplicationRecord
    belongs_to :real_property
    has_one :assessed_value
    validates :number, presence: true, uniqueness: true
  end
end
