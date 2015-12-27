class CreateFieldConditions < ActiveRecord::Migration
  def change
    create_table :field_conditions do |t|
      t.string :condition
      t.string :field_id

      t.timestamps null: false
    end
  end
end
