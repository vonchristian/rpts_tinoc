class RemoveConsolidatorFromConsolidations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :consolidations, :consolidator, foreign_key: { to_table: :taxpayers }, type: :uuid
  end
end
