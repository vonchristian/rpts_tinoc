class CreatePropertyBoundaries < ActiveRecord::Migration[5.1]
  def change
    create_table :property_boundaries, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.string :type
      t.text :remarks

      t.timestamps
    end
    add_index :property_boundaries, :type
  end
end
