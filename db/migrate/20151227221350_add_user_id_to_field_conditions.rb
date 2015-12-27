class AddUserIdToFieldConditions < ActiveRecord::Migration
  def change
    add_column :field_conditions, :user_id, :string
  end
end
