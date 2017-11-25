class CreateCancellations < ActiveRecord::Migration[5.1]
  def change
    create_table :cancellations, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.datetime :date_cancelled

      t.timestamps
    end
  end
end
