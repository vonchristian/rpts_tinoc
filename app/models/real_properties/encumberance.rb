module RealProperties
  class Encumberance < ApplicationRecord
    belongs_to :real_property
    has_one :archiving, as: :archiveable, class_name: "Archiver"
    def cancel!
      create_archiving(date_archived: Time.zone.now)
    end
    def cancelled?
      archiving.present?
    end
  end
end
