class Taxation < ApplicationRecord
  belongs_to :general_revision
  belongs_to :real_property

  delegate :maximum_penalty_rate, :penalty_rate, :maximum_number_of_deliquency, to: :general_revision
  has_many :real_property_taxes
  has_many :taxes, through: :real_property_taxes

  def compute_tax(tax)
    tax.rate * real_property.assessed_value
  end
  def compute_penalty(tax)
    (general_revision.penalty_rate * number_of_months_deliquent) * compute_tax(tax)
  end
  def number_of_months_deliquent
    effectivity_date.year.upto(Date.today.year).count * 12
  end
  def self.unpaid
    select{ |a| !a.paid? }
  end

  def paid?
    assessments == payments
  end
  def assessments
    real_property.assessments(from_date: effectivity_date.beginning_of_year, to_date: effectivity_date.end_of_year)
  end
  def payments
    real_property.payments(from_date: effectivity_date.beginning_of_year, to_date: effectivity_date.end_of_year)
  end
  def unpaid_taxes
    assessments - payments
  end
end
