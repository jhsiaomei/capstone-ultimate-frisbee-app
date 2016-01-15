class RemoveColumnsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :date_start, :date
    remove_column :events, :date_stop, :date
    remove_column :events, :time_start, :time
    remove_column :events, :time_stop, :time
  end
end
