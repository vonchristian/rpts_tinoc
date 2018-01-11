module RealProperties
  class AssessedRealProperty < ApplicationRecord
    belongs_to :real_property

    validates :number, presence: true, uniqueness: true
  end
end
