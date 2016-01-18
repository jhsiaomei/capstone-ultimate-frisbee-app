class AddLatAndLongToFields < ActiveRecord::Migration
  def change
    add_column :fields, :latitude, :float
    add_column :fields, :longitude, :float
  end
end
