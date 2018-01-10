class CreateAdjustmentFactors < ActiveRecord::Migration[5.1]
  def change
    create_table :adjustment_factors, id: :uuid do |t|
      t.string :name
      t.decimal :percent, default: 0

      t.timestamps
    end
    add_index :adjustment_factors, :name, unique: true
  end
end
