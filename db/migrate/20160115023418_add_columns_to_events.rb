class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_datetime, :datetime
    add_column :events, :stop_datetime, :datetime
  end
end
