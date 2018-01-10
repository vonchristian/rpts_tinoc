class AddAreaToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_properties, :area, :decimal
  end
end
