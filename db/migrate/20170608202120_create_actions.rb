class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string  :name
      t.string  :attack_type
      t.integer :hit_bonus
      t.string  :reach
      t.string  :target
      t.string  :damage
      t.string  :damage_type
      t.string  :damage_2
      t.string  :damage_2_type
      t.string  :desc

      t.references :creature, index: true

      t.timestamps
    end
  end
end
