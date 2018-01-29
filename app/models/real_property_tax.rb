class RealPropertyTax < ApplicationRecord
  belongs_to :tax
  belongs_to :real_property
  belongs_to :taxation
  delegate :revenue_account, to: :tax, prefix: true

  def balance(options={})
    tax.revenue_account_balance(commercial_document_id: real_property.id)
  end
end
