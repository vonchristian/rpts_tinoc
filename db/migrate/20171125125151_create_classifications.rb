class CreateClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
    add_index :classifications, :name, unique: true
  end
end
