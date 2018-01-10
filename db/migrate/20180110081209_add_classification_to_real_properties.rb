class AddClassificationToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :real_properties, :classification, foreign_key: true, type: :uuid
  end
end
