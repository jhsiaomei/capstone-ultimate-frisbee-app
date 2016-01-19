class ChangeFieldIdsToIntegers < ActiveRecord::Migration
  def change
    change_column :field_conditions, :field_id, 'integer USING CAST(field_id AS integer)'
    change_column :field_conditions, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :events, :field_id, 'integer USING CAST(field_id AS integer)'
  end
end
