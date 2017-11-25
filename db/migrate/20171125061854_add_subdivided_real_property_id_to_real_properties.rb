class AddSubdividedRealPropertyIdToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :real_properties, :subdivided_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
  end
end
