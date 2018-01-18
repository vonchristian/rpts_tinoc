class AddCancelledToAssessedValues < ActiveRecord::Migration[5.1]
  def change
    add_column :assessed_values, :cancelled, :boolean, default: :false
  end
end
