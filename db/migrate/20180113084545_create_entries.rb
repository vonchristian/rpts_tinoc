class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries, id: :uuid do |t|
      t.references :commercial_document, polymorphic: true, type: :uuid, index: { name: "index_commercial_document_on_entries" }
      t.datetime :date
      t.string :description
      t.string :reference_number

      t.timestamps
    end
  end
end
