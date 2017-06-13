class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
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
