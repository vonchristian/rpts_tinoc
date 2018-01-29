module RealProperties
  class AssessedValue < ApplicationRecord
    belongs_to :real_property
    belongs_to :assessed_real_property
    def self.current(options)
      if options[:from_date] && options[:to_date]
        date_range = DateRange.new(from_date: options[:from_date], to_date: options[:to_date])
        assessed = where('effectivity_date' =>(date_range.start_date..date_range.end_date)).last
        if assessed.present?
          assessed
        else
          order(effectivity_date: :asc).last.try(:assessed_value)
        end
      else
        order(effectivity_date: :asc).last.try(:assessed_value)
      end
    end

    def paid?
      balance.zero?
    end

    def balance
      accounts_receivable_account.balance(commercial_document: self)
    end
    def assessments_total
      accounts_receivable_account.debits_balance(commercial_document: self)
    end
    def payments_total
      accounts_receivable_account.credits_balance(commercial_document: self)
    end
    def accounts_receivable_account
      Configurations::AccountsReceivableConfig.accounts_receivable_account
    end
    def cancel!
      self.cancelled = true
      self.save
    end
  end
end
