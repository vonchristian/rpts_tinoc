class CreateRealPropertySubClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :real_property_sub_classifications, id: :uuid do |t|
      t.belongs_to :real_property, foreign_key: true, type: :uuid
      t.belongs_to :sub_classification, foreign_key: true, type: :uuid, index: { name: 'index_sub_classification_on_real_property_sub_classifications' }
      t.datetime :effectivity_date

      t.timestamps
    end
  end
end
