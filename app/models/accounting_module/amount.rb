module AccountingModule
  class Amount < ApplicationRecord
    belongs_to :entry
    belongs_to :account
  end
end
