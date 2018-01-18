module AccountingModule
  class Entry < ApplicationRecord
    belongs_to :commercial_document, polymorphic: true
  end
end
