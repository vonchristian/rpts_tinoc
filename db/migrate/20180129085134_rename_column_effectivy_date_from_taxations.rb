class RenameColumnEffectivyDateFromTaxations < ActiveRecord::Migration[5.2]
  def change
    rename_column :taxations, :effectivy_date, :effectivity_date
  end
end
