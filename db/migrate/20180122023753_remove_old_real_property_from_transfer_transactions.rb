class RemoveOldRealPropertyFromTransferTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :transfer_transactions, :old_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
    remove_reference :transfer_transactions, :new_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
    remove_reference :transfer_transactions, :new_owner, foreign_key: { to_table: :taxpayers }, type: :uuid

  end
end
