class CreateAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :amounts, id: :uuid do |t|
      t.belongs_to :entry, foreign_key: true, type: :uuid
      t.string :type
      t.belongs_to :account, foreign_key: true, type: :uuid
      t.decimal :amount

      t.timestamps
    end
    add_index :amounts, :type
    add_index :amounts, [:account_id, :entry_id]
    add_index :amounts, [:entry_id, :account_id]
  end
end
