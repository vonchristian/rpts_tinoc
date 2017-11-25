class CreateRealPropertyOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :real_property_ownerships, id: :uuid do |t|
      t.belongs_to :taxpayer, foreign_key: true, type: :uuid
      t.belongs_to :real_property, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
