class DeliquenciesQuery
  attr_reader :relation
  def initialize(relation = RealProperty.all)
    @relation = relation
  end
  def delinquency_period
    payments.last.entry_date..Date.today
  end
  def start_date
  end
  def end_date
  end
end
