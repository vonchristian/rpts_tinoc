class TransferTransaction < ApplicationRecord
  belongs_to :new_owner, class_name: "Taxpayer", foreign_key: 'new_owner_id'
  belongs_to :previous_owner, class_name: "Taxpayer", foreign_key: 'previous_owner_id'
  belongs_to :real_property

  validates :date_transferred, presence: true

  delegate :description, to: :real_property, prefix: true
end
