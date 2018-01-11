class RemoveAreaFromRealProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :real_properties, :area, :decimal
  end
end
