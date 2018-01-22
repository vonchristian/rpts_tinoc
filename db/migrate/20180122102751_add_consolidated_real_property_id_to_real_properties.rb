class AddConsolidatedRealPropertyIdToRealProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :real_properties, :consolidated_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
  end
end
