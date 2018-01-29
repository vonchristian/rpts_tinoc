class AddAttributesToGeneralRevisions < ActiveRecord::Migration[5.2]
  def change
    add_column :general_revisions, :maximum_number_of_deliquency, :decimal, default: 1
    add_column :general_revisions, :penalty_rate, :decimal, default: 01
  end
end
