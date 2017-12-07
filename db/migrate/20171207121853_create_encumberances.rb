class CreateEncumberances < ActiveRecord::Migration[5.1]
  def change
    create_table :encumberances, id: :uuid do |t|
      t.text :content
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.datetime :date

      t.timestamps
    end
  end
end
