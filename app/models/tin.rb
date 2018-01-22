class Tin < ApplicationRecord
  belongs_to :tinable, polymorphic: true
  validates :number, :date_issued, presence: true
  validates :number, uniqueness: true
end
