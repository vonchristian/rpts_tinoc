class AddCodeToMunicipalities < ActiveRecord::Migration[5.2]
  def change
    add_column :municipalities, :code, :string
  end
end
