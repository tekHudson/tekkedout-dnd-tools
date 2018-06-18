class CreateTraits < ActiveRecord::Migration[5.0]
  def change
    create_table :traits do |t|
      t.string  :name
      t.string  :desc

      t.references :creature, index: true

      t.timestamps
    end
  end
end
