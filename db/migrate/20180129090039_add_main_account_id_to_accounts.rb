class AddMainAccountIdToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :main_account, foreign_key: { to_table: :accounts }, type: :uuid
  end
end
