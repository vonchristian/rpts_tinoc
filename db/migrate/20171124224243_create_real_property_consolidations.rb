class CreateRealPropertyConsolidations < ActiveRecord::Migration[5.1]
  def change
    create_table :real_property_consolidations, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.belongs_to :consolidation, foreign_key: true, type: :uuid
      t.belongs_to :consolidator, foreign_key: { to_table: :taxpayers }, type: :uuid

      t.timestamps
    end
  end
end
