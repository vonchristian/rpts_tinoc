class CreateRealPropertyAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :real_property_areas, id: :uuid do |t|
      t.decimal :area
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.datetime :effectivity_date

      t.timestamps
    end
  end
end
