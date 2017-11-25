class CreatePreviousRealProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :previous_real_properties, id: :uuid do |t|
      t.belongs_to :latest_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
      t.belongs_to :old_real_property, foreign_key: { to_table: :real_properties }, type: :uuid

      t.timestamps
    end
  end
end
