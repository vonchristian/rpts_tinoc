class AddConsolidatorToConsolidations < ActiveRecord::Migration[5.2]
  def change
    add_reference :consolidations, :consolidator, polymorphic: true, type: :uuid
  end
end
