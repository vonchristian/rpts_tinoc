class AddDescriptionToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_properties, :description, :string
  end
end
