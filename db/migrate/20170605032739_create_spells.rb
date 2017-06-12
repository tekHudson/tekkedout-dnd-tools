class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.integer :level
      t.string :name
      t.string :sub_klass, array:true, default: []
      t.string :casting_time
      t.string :range
      t.string :components
      t.string :duration
      t.string :description
      t.string :klass, array:true, default: []

      t.timestamps
    end
  end
end
