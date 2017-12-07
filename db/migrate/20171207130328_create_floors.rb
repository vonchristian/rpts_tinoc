class CreateFloors < ActiveRecord::Migration[5.1]
  def change
    create_table :floors, id: :uuid do |t|
      t.belongs_to :building, foreign_key: { to_table: :real_properties }, type: :uuid
      t.decimal :area

      t.timestamps
    end
  end
end
