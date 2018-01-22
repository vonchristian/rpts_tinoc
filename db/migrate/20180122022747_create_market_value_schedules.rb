class CreateMarketValueSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :market_value_schedules, id: :uuid do |t|
      t.belongs_to :sub_classification, foreign_key: true, type: :uuid
      t.belongs_to :municipality, foreign_key: true, type: :uuid
      t.decimal :market_value
      t.datetime :effectivity_date
      t.string :unit

      t.timestamps
    end
  end
end
