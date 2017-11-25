class CreateRealPropertyOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :real_property_ownerships, id: :uuid do |t|
      t.references :property_owner, polymorphic: true, type: :uuid, index: { name: 'index_on_real_property_ownerships_property_owner_id'}
      t.belongs_to :real_property, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
