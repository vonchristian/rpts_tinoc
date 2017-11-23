class CreateAssessedRealProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :assessed_real_properties, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.string :number
      t.boolean :cancelled

      t.timestamps
    end
    add_index :assessed_real_properties, :number, unique: true
  end
end
