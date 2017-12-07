class CreateTins < ActiveRecord::Migration[5.1]
  def change
    create_table :tins, id: :uuid do |t|
      t.references :tinable, polymorphic: true, type: :uuid
      t.datetime :date_issued
      t.string :number

      t.timestamps
    end
    add_index :tins, :number, unique: true
  end
end
