class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.integer :level
      t.string :name
      t.string :sub_class
      t.string :casting_time
      t.string :range
      t.string :components
      t.string :duration
      t.string :description
      t.string :other

      t.timestamps
    end
  end
end
