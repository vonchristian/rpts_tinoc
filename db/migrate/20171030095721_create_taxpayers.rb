class CreateTaxpayers < ActiveRecord::Migration[5.1]
  def change
    create_table :taxpayers, id: :uuid do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :contact_number
      t.string :email

      t.timestamps
    end
    add_index :taxpayers, :email, unique: true
  end
end
