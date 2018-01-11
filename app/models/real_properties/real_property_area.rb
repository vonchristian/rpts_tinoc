module RealProperties
  class RealPropertyArea < ApplicationRecord
    belongs_to :real_property
    has_many :revisions, as: :revised_data
    before_save :set_effectivity_date
    def self.current(options={})
      if options[:from_date] && options[:to_date]
        from_date = options[:from_date].kind_of?(DateTime) ? options[:from_date] : Chronic.parse(options[:from_date].strftime('%Y-%m-%d 12:00:00'))
        to_date = options[:to_date].kind_of?(DateTime) ? options[:to_date] : Chronic.parse(options[:to_date].strftime('%Y-%m-%d 12:59:59'))
        where('effectivity_date' => (from_date.yesterday.end_of_day)..(to_date.end_of_day)).last.area
      else
        order(effectivity_date: :asc).last.area
      end
    end

    private
    def set_effectivity_date
      self.effectivity_date ||= Time.zone.now
    end
  end
end
