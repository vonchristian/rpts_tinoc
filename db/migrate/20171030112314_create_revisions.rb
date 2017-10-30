class CreateRevisions < ActiveRecord::Migration[5.1]
  def change
    create_table :revisions, id: :uuid do |t|
      t.datetime :date
      t.belongs_to :real_property, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
