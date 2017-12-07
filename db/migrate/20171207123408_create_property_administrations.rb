class CreatePropertyAdministrations < ActiveRecord::Migration[5.1]
  def change
    create_table :property_administrations, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.references :administrator, polymorphic: true, type: :uuid, index: { name: "index_on_administrator_on_property_administrations" }

      t.timestamps
    end
  end
end
