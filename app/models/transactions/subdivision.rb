module Transactions
  class Subdivision < ApplicationRecord
    belongs_to :divided_real_property, class_name: "RealProperty"
    belongs_to :real_property
  end
end
