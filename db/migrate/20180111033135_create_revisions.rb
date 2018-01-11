class CreateRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :revisions, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.references :revised_data, polymorphic: true, type: :uuid
      t.datetime :effectivity_date, null: false
      t.text :remarks, null: false

      t.timestamps
    end
  end
end
