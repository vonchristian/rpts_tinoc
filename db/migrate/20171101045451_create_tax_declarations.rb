class CreateTaxDeclarations < ActiveRecord::Migration[5.1]
  def change
    create_table :tax_declarations, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.string :number

      t.timestamps
    end
    add_index :tax_declarations, :number, unique: true
  end
end
