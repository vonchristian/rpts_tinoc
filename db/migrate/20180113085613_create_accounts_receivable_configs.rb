class CreateAccountsReceivableConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts_receivable_configs, id: :uuid do |t|
      t.belongs_to :accounts_receivable_account, foreign_key: { to_table: :accounts }, type: :uuid, index: { name: "index_ar_account_on_ar_config" }

      t.timestamps
    end
  end
end
