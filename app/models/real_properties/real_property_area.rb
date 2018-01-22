module RealProperties
  class RealPropertyArea < ApplicationRecord
    belongs_to :real_property
    has_many :revisions, as: :revised_data
    before_save :set_effectivity_date
    def self.current
       order(created_at: :asc).last.area
    end

    private
    def set_effectivity_date
      self.effectivity_date ||= Time.zone.now
    end
  end
end
