class CreateBuildingDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :building_descriptions, id: :uuid do |t|
      t.belongs_to :building, foreign_key: { to_table: :real_properties }, type: :uuid
      t.string :kind
      t.string :structural_type
      t.datetime :certififate_of_completion_issued_on
      t.datetime :certificate_of_occupancy_issued_on
      t.datetime :date_constructed
      t.datetime :date_occupied

      t.timestamps
    end
  end
end
