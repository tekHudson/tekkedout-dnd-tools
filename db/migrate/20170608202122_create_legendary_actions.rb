class CreateLegendaryActions < ActiveRecord::Migration[5.0]
  def change
    create_table :legendary_actions do |t|
      t.string  :name
      t.string  :desc

      t.references :creature, index: true

      t.timestamps
    end
  end
end
