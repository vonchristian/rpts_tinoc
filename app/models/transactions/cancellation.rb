module Transactions
  class Cancellation < ApplicationRecord
    belongs_to :real_property
  end
end
