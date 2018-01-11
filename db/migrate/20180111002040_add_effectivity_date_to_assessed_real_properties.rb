class AddEffectivityDateToAssessedRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :assessed_real_properties, :effectivity_date, :datetime
  end
end
