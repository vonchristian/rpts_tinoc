class CreateTaxations < ActiveRecord::Migration[5.2]
  def change
    create_table :taxations, id: :uuid do |t|
      t.belongs_to :general_revision, foreign_key: true, type: :uuid
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.datetime :effectivy_date

      t.timestamps
    end
  end
end
