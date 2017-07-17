class AddCreatureIdToCombatant < ActiveRecord::Migration[5.0]
  def change
    add_column :combatants, :creature_id, :integer
  end
end
