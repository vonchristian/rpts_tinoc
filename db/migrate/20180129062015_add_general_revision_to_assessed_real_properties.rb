class AddGeneralRevisionToAssessedRealProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :assessed_real_properties, :general_revision, foreign_key: true, type: :uuid
    add_reference :assessed_real_properties, :municipality, foreign_key: true, type: :uuid
    add_reference :assessed_real_properties, :barangay, foreign_key: true, type: :uuid
    add_column :assessed_real_properties, :assigned_number, :integer
  end
end
