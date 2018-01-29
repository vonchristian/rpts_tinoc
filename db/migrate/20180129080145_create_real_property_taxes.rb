class CreateRealPropertyTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :real_property_taxes, id: :uuid do |t|
      t.belongs_to :tax, foreign_key: true, type: :uuid
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.belongs_to :taxation, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
