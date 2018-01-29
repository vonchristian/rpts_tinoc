class AddCodeToBarangays < ActiveRecord::Migration[5.2]
  def change
    add_column :barangays, :code, :string
  end
end
