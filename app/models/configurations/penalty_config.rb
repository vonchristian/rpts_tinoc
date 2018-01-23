module Configurations
  class PenaltyConfig < ApplicationRecord
    validates :max_no_month, :penalty_rate, presence: true, numericality: true
    def penalty(assessed_value)
      rate * number_of_months_delated(real_property) * assessed_value
    end
    def number_of_months_delayed
      prev_year_paid?
      real_property.payments.last.date..Date.today.each do |date|
      date.paid?

  end
end
