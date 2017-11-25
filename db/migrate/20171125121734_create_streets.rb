class CreateStreets < ActiveRecord::Migration[5.1]
  def change
    create_table :streets, id: :uuid do |t|
      t.belongs_to :barangay, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
