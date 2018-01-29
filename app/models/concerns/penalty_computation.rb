class PenaltyComputation
  def years_unpaid(real_property)
    real_property.taxations.unpaid.each do |taxation|
      compute_basic_tax(taxation)
      compute_special_education_fund_tax(taxation)
      compute_penalty(taxation)
    end
  end
  def compute_basic_tax(taxation)
    assessed_value * taxation.basic_tax_rate
  end
  def compute_special_

  def compute_penalty(taxation)
    real_property.assessed_value * taxation_rate
  end
  def taxation_rate(taxation)
    if taxation.real_property.number_of_months_deliquent(taxation) > taxation.maximum_number_of_deliquency
      taxation.maximum_penalty_rate
    else
      taxation.penalty_rate
    end
  end
end
