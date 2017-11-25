class CreateSubClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_classifications, id: :uuid do |t|
      t.belongs_to :classification, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
