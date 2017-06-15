class CreateCombatants < ActiveRecord::Migration[5.0]
  def change
    create_table :combatants do |t|
      t.belongs_to :combat_tracker, index: true
      t.string :name, null: false
      t.integer :init
      t.integer :max_hp
      t.integer :hp
      t.integer :ac
      t.integer :dc
      t.timestamps
    end
  end
end
