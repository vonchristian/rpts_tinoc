class CreatePenaltyConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :penalty_configs, id: :uuid do |t|
      t.integer :max_no_month
      t.decimal :penalty_rate

      t.timestamps
    end
  end
end
