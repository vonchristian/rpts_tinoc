module RealProperties
  class AssessedRealProperty < ApplicationRecord
    belongs_to :real_property
    belongs_to :general_revision
    belongs_to :municipality, class_name: "Locations::Municipality"
    belongs_to :barangay, class_name: "Locations::Barangay"
    has_one :assessed_value
    validates :number, presence: true, uniqueness: true
    has_one :archiving, as: :archiveable, class_name: "Archiver"

    def self.current
      order(created_at: :asc).last.try(:number) || MissingArp.new.current
    end
    def cancel!
      create_archiving(date_archived: Time.zone.now)
    end
    def cancelled?
      archiving.present?
    end
  end
end
