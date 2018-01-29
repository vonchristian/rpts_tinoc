class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes, id: :uuid do |t|
      t.string :name
      t.belongs_to :revenue_account, foreign_key: { to_table: :accounts }, type: :uuid
      t.boolean :default_tax, default: false

      t.timestamps
    end
    add_index :taxes, :name, unique: true
  end
end
