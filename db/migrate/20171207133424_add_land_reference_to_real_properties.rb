class AddLandReferenceToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :real_properties, :land_reference, foreign_key: { to_table: :real_properties }, type: :uuid
  end
end
