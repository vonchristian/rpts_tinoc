class Archiver < ApplicationRecord
  belongs_to :archiveable, polymorphic: true
end
