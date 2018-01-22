class RemoveSubdividedRealPropertyFromRealProperties < ActiveRecord::Migration[5.2]
  def change
    remove_reference :real_properties, :subdivided_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
  end
end
