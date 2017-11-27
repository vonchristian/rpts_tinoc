class AddTaxablityToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_properties, :taxability, :integer
    add_index :real_properties, :taxability
  end
end
