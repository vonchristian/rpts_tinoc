module AccountingModule
  class Account < ApplicationRecord
    include PgSearch
    pg_search_scope :text_search, :against => [:name, :code]

    class_attribute :normal_credit_balance

    has_many :amounts, class_name: "AccountingModule::Amount"
    has_many :credit_amounts, :class_name => 'AccountingModule::CreditAmount'
    has_many :debit_amounts,  :class_name => 'AccountingModule::DebitAmount'
    has_many :entries, through: :amounts, source: :entry
    has_many :credit_entries, :through => :credit_amounts, :source => :entry, :class_name => 'AccountingModule::Entry'

    has_many :debit_entries, :through => :debit_amounts, :source => :entry, :class_name => 'AccountingModule::Entry'

    has_many :subsidiary_accounts, class_name: "AccountingModule::Account", foreign_key: 'main_account_id'
    belongs_to :main_account, class_name: "AccountingModule::Account"
    validates :type, presence: true
    validates :name, :code, presence: true, uniqueness: true

    scope :assets, -> { where(type: 'AccountingModule::Asset') }
    scope :liabilities, -> { where(type: 'AccountingModule::Liability') }
    scope :equities, -> { where(type: 'AccountingModule::Equity') }
    scope :revenues, -> { where(type: 'AccountingModule::Revenue') }
    scope :expenses, -> { where(type: 'AccountingModule::Expense') }

    def self.updated_at(options={})
      if options[:from_date] && options[:to_date]
        from_date = options[:from_date].kind_of?(DateTime) ? options[:from_date] : Chronic.parse(options[:from_date].strftime('%Y-%m-%d 12:00:00'))
        to_date = options[:to_date].kind_of?(DateTime) ? options[:to_date] : Chronic.parse(options[:to_date].strftime('%Y-%m-%d 12:59:59'))
        where('updated_at' => (from_date.beginning_of_day)..(to_date.end_of_day))
      end
    end

    def self.updated_by(employee)
      all.select{|a| a.updated_by(employee) }
    end
    def updated_by(employee)
      entries.recorded_by(employee)
    end

    def self.loan_accounts
      LoansModule::LoanProduct.accounts.uniq.map do |a|
        self.find_by(name: a.to_s)
      end
    end
    def account_name
      name
    end

    def self.types
      ["AccountingModule::Asset",
       "AccountingModule::Equity",
       "AccountingModule::Liability",
       "AccountingModule::Expense",
       "AccountingModule::Revenue"]
     end

    def self.balance(options={})
      if self.new.class == AccountingModule::Account
        raise(NoMethodError, "undefined method 'balance'")
      else
        accounts_balance = BigDecimal.new('0')
        accounts = self.all
        accounts.each do |account|
          if account.contra?
            accounts_balance -= account.balance(options)
          else
            accounts_balance += account.balance(options)
          end
        end
        accounts_balance
      end
    end

    def self.trial_balance
      if self.new.class == AccountingModule::Account
        AccountingModule::Asset.balance - (AccountingModule::Liability.balance + AccountingModule::Equity.balance + AccountingModule::Revenue.balance - AccountingModule::Expense.balance)
      else
        raise(NoMethodError, "undefined method 'trial_balance'")
      end
    end

    def balance(options={})
      if self.class == AccountingModule::Account
        raise(NoMethodError, "undefined method 'balance'")
      else
        if self.normal_credit_balance ^ contra
          credits_balance(options) - debits_balance(options)
        else
          debits_balance(options) - credits_balance(options)
        end
      end
    end
    def credits_balance(options={})
      if subsidiary_accounts.present?
        subsidiary_accounts.map{ |a| a.debit_amounts.balance(options) }.sum + debit_amounts.balance(options)
      else
        credit_amounts.balance(options)
      end
    end
    def debits_balance(options={})
      if subsidiary_accounts.present?
        subsidiary_accounts.map{ |a| a.debit_amounts.balance(options) }.sum + debit_amounts.balance(options)
      else
        debit_amounts.balance(options)
      end
    end
  end
end
