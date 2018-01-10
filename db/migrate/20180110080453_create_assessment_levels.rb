class CreateAssessmentLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :assessment_levels, id: :uuid do |t|
      t.belongs_to :classification, foreign_key: true, type: :uuid
      t.decimal :percent
      t.date :effectivity_date

      t.timestamps
    end
  end
end
