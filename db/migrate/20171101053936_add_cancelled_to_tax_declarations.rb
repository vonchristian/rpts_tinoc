class AddCancelledToTaxDeclarations < ActiveRecord::Migration[5.1]
  def change
    add_column :tax_declarations, :cancelled, :boolean, default: false
  end
end
