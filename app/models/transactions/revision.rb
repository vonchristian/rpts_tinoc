module Transactions
  class Revision < ApplicationRecord
    belongs_to :real_property
  end
end
