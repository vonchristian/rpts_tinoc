class CreateMarketValueRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :market_value_revisions, id: :uuid do |t|
      t.belongs_to :sub_classification, foreign_key: true, type: :uuid
      t.decimal :market_value
      t.string :unit
      t.date :effectivity_date

      t.timestamps
    end
  end
end
