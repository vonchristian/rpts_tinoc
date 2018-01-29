class CreateGeneralRevisions < ActiveRecord::Migration[5.2]
  def change
    create_table :general_revisions, id: :uuid do |t|
      t.date :effectivity_year
      t.string :name

      t.timestamps
    end
    add_index :general_revisions, :name, unique: true
  end
end
