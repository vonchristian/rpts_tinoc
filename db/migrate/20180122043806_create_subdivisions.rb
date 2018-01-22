class CreateSubdivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :subdivisions, id: :uuid do |t|
      t.belongs_to :divided_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
      t.datetime :date
      t.belongs_to :real_property, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
