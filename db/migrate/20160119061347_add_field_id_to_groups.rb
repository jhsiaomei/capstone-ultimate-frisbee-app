class AddFieldIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :field_id, :integer
  end
end
