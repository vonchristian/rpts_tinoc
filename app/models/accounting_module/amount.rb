module AccountingModule
  class Amount < ApplicationRecord
    extend AccountingModule::BalanceFinder
    belongs_to :entry, :class_name => 'AccountingModule::Entry', touch: true
    belongs_to :account, :class_name => 'AccountingModule::Account', touch: true
    belongs_to :recorder, class_name: "User", foreign_key: 'recorder_id', touch: true
    belongs_to :commercial_document, polymorphic: true, touch: true
    validates :type, :amount, :entry, :account, :commercial_document, presence: true
    validates :amount, numericality: true

    delegate :name, to: :account, prefix: true

    def self.recorded_by(recorder_id)
      where('recorder_id' => recorder_id)
    end

    def self.total
      distinct.sum(:amount)
    end

    def self.entered_on(hash={})
      if hash[:from_date] && hash[:to_date]
       from_date = hash[:from_date].kind_of?(DateTime) ? hash[:from_date] : Chronic.parse(hash[:from_date].strftime('%Y-%m-%d 12:00:00'))
        to_date = hash[:to_date].kind_of?(DateTime) ? hash[:to_date] : Chronic.parse(hash[:to_date].strftime('%Y-%m-%d 12:59:59'))
        where('created_at' => (from_date.beginning_of_day)..(to_date.end_of_day))
      else
        all
      end
    end

  end
end
