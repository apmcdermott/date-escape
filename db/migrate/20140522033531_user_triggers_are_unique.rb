class UserTriggersAreUnique < ActiveRecord::Migration
  def change
    change_table :scenario_messages do |t|
      add_index :scenario_messages, [:user_id, :message_id], unique: true
    end
  end
end
