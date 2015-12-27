class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :intersection
      t.string :street_number
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
