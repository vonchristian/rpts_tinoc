class Tin < ApplicationRecord
  belongs_to :tinable, polymorphic: true
  validate :number, :date_issued, presence: true
  validates :number, uniqueness: true
end
