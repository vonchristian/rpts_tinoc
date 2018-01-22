class CreateArchivers < ActiveRecord::Migration[5.2]
  def change
    create_table :archivers, id: :uuid do |t|
      t.references :archiveable, polymorphic: true, type: :uuid
      t.datetime :date_archived

      t.timestamps
    end
  end
end
