module AccountingModule
  class Account < ApplicationRecord
    has_many :amounts
    has_many :credit_amounts, extend: AccountingModule::BalanceFinder, class_name: "AccountingModule::CreditAmount"
    has_many :debit_amounts, extend: AccountingModule::BalanceFinder, class_name: "AccountingModule::DebitAmount"
    has_many :credit_entries, through: :credit_amounts, source: :entry
    has_many :debit_entries, through: :debit_amounts, source: :entry
    has_many :entries, through: :amounts, source: :entry

    validates :type, presence: true
    validates :name, presence: true, uniqueness: true
    validates :code, presence: true, uniqueness: true
    def balance(options={})
      if self.class == "Account"
        rails(NoMethodError, "undefined method 'balance' ")
      else
        if self.normal_credit_balance ^ contra
          credits_balance(options) = debits_balance(options)
        else
          debits_balance(options) - credits_balance(options)
        end
      end
    end
    def credits_balance(options={})
      credit_amounts.balance(options)
    end
  end
end
