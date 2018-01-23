module RealProperties
  class AssessedRealProperty < ApplicationRecord
    belongs_to :real_property
    has_one :assessed_value
    validates :number, presence: true, uniqueness: true
    def self.current
      order(created_at: :asc).last.try(:number) || MissingArp.new.current
    end
  end
end
