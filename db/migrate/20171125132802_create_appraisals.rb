class CreateAppraisals < ActiveRecord::Migration[5.1]
  def change
    create_table :appraisals, id: :uuid do |t|
      t.string :type
      t.decimal :unit_value
      t.decimal :market_value
      t.datetime :date
      t.belongs_to :classification, foreign_key: true, type: :uuid
      t.belongs_to :sub_classification, foreign_key: true, type: :uuid
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.timestamps
    end
    add_index :appraisals, :type
  end
end
