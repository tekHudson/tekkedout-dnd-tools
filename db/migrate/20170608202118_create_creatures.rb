class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :name, null: false
      t.string :species, null: false
      t.string :size, null: false
      t.string :alignment, null: false
      t.integer :ac, null: false
      t.integer :hp, null: false
      t.string :speed, array:true, default: []
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
      t.string :saving_throws, array:true, default: []
      t.string :skills, array:true, default: []
      t.string :damage_immunities, array:true, default: []
      t.string :damage_resistance, array:true, default: []
      t.string :condition_immunities, array:true, default: []
      t.string :senses, array:true, default: []
      t.string :languages, array:true, default: []
      t.string :chalange, null: false
      t.integer :xp, null: false
      t.string :book, null: false
      t.integer :page, null: false

      t.timestamps
    end
  end
end
