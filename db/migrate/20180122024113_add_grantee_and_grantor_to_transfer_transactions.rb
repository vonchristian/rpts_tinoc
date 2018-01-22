class AddGranteeAndGrantorToTransferTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transfer_transactions, :grantee, foreign_key: { to_table: :taxpayers }, type: :uuid
    add_reference :transfer_transactions, :grantor, foreign_key: { to_table: :taxpayers }, type: :uuid
    add_reference :transfer_transactions, :transferred_real_property, foreign_key: { to_table: :real_properties }, type: :uuid
    add_column :transfer_transactions, :remarks, :text
  end
end
