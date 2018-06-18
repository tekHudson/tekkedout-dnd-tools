class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string  :name, null: false
      t.string  :size
      t.string  :monster_type
      t.string  :alignment
      t.string  :hp
      t.string  :ac
      t.string  :speed
      t.integer :challenge_rating
      t.string  :xp
      t.integer :str
      t.integer :str_mod
      t.integer :dex
      t.integer :dex_mod
      t.integer :con
      t.integer :con_mod
      t.integer :int
      t.integer :int_mod
      t.integer :wis
      t.integer :wis_mod
      t.integer :cha
      t.integer :cha_mod
      t.string  :saving_throws
      t.string  :skills
      t.string  :vulnerabilities
      t.string  :damage_resistance
      t.string  :damage_immunities
      t.string  :condition_immunities
      t.integer :passive_perception
      t.string  :senses
      t.string  :languages

      t.timestamps
    end
  end
end
