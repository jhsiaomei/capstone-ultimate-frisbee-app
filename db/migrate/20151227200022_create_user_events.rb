class CreateUserEvents < ActiveRecord::Migration
  def change
    create_table :user_events do |t|
      t.string :user_id
      t.string :event_id
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
