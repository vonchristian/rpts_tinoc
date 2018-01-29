class AddBarangayToRealProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :real_properties, :barangay, foreign_key: true, type: :uuid
  end
end
