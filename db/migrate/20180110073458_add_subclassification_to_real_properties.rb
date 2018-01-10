class AddSubclassificationToRealProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :real_properties, :sub_classification, foreign_key: true, type: :uuid
  end
end
