class CreateMarketValues < ActiveRecord::Migration[5.1]
  def change
    create_table :market_values, id: :uuid do |t|
      t.belongs_to :sub_classification, foreign_key: true, type: :uuid
      t.decimal :market_value
      t.datetime :effectivity_date
      t.string :unit

      t.timestamps
    end
  end
end
