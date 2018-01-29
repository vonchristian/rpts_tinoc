class AddMunicipalityToRealProperties < ActiveRecord::Migration[5.2]
  def change
    add_reference :real_properties, :municipality, foreign_key: true, type: :uuid
  end
end
