class AddConsolidatedRealPropertyToConsolidations < ActiveRecord::Migration[5.2]
  def change
    add_reference :consolidations, :consolidated_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
  end
end
