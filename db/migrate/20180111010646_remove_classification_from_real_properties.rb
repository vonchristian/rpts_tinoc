class RemoveClassificationFromRealProperties < ActiveRecord::Migration[5.1]
  def change
    remove_reference :real_properties, :classification, foreign_key: true, type: :uuid
  end
end
