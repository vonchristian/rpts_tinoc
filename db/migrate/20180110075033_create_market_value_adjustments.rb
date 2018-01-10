class CreateMarketValueAdjustments < ActiveRecord::Migration[5.1]
  def change
    create_table :market_value_adjustments, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.belongs_to :adjustment_factor, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
