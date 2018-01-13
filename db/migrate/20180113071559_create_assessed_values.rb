class CreateAssessedValues < ActiveRecord::Migration[5.1]
  def change
    create_table :assessed_values, id: :uuid do |t|
      t.decimal :assessed_value
      t.datetime :effectivity_date
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.belongs_to :assessed_real_property, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
