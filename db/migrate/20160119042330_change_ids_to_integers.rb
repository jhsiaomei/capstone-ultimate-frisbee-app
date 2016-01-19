class ChangeIdsToIntegers < ActiveRecord::Migration
  def change
    change_column :user_events, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :user_events, :event_id, 'integer USING CAST(event_id AS integer)'
    change_column :user_groups, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :user_groups, :group_id, 'integer USING CAST(group_id AS integer)'    
  end
end
