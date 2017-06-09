class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :init, null: false
      t.integer :max_hp, null: false
      t.integer :hp, null: false
      t.integer :ac, null: false
      t.integer :dc, null: false
      t.timestamps
    end
  end
end
