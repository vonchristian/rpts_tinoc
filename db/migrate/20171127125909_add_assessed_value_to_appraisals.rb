class AddAssessedValueToAppraisals < ActiveRecord::Migration[5.1]
  def change
    add_column :appraisals, :assessed_value, :decimal
  end
end
