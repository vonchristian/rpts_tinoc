class AddAssessedValueToAssessedRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :assessed_real_properties, :assessed_value, foreign_key: true, type: :uuid
  end
end
