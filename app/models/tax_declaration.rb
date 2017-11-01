class TaxDeclaration < ApplicationRecord
  belongs_to :real_property

  validates :number, presence: true, uniqueness: true
  def self.cancel_all
    all.each do |tx|
      tx.cancelled = true
      tx.save
    end
  end
end
