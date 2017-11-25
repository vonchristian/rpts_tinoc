class CreateBarangays < ActiveRecord::Migration[5.1]
  def change
    create_table :barangays, id: :uuid do |t|
      t.belongs_to :municipality, foreign_key: true, type: :uuid
      t.string :name

      t.timestamps
    end
  end
end
