class CreateTransferTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transfer_transactions, id: :uuid do |t|
      t.belongs_to :new_owner, foreign_key: { to_table: :taxpayers }, type: :uuid
      t.belongs_to :old_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
      t.belongs_to :new_real_property, foreign_key: { to_table: :real_properties }, type: :uuid

      t.datetime :date_transferred

      t.timestamps
    end
  end
end
