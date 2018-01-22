module Transactions
  class ConsolidationForm
    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :consolidated_real_property_id, :consolidator_id, :consolidator_type

    def consolidate!
      ActiveRecord::Base.transaction do
        save_consolidation
      end
    end

    private
    def save_consolidation
      Transactions::Consolidation.create(consolidated_real_property_id: consolidated_real_property_id, consolidator_id: consolidator_id, consolidator_type: consolidator_type)
    end
  end
end
