class CreateRealProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :real_properties, id: :uuid do |t|
      t.string :type

      t.timestamps
    end
    add_index :real_properties, :type
  end
end
