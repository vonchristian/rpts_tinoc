class CreateRealPropertyClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :real_property_classifications, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.belongs_to :classification, foreign_key: true, type: :uuid
      t.datetime :effectivity_date
      t.timestamps
    end
  end
end
