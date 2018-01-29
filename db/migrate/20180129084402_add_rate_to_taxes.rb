class AddRateToTaxes < ActiveRecord::Migration[5.2]
  def change
    add_column :taxes, :rate, :decimal
  end
end
