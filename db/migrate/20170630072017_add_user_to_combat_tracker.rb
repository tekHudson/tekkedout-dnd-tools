class AddUserToCombatTracker < ActiveRecord::Migration[5.0]
  def change
    add_column :combat_trackers, :user_id, :integer, null: false
  end
end
