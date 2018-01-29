class Tax < ApplicationRecord
  belongs_to :revenue_account, class_name: "AccountingModule::Account"
  def self.default
    where(default_tax: true)
  end
end
