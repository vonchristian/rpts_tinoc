class CreateConsolidations < ActiveRecord::Migration[5.1]
  def change
    create_table :consolidations, id: :uuid do |t|
      t.belongs_to :consolidator, foreign_key: { to_table: :taxpayers }, type: :uuid
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.datetime :date

      t.timestamps
    end
  end
end
