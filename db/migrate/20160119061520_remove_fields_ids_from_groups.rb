class RemoveFieldsIdsFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :field_id_1, :integer
    remove_column :groups, :field_id_2, :integer
    remove_column :groups, :field_id_3, :integer
  end
end
