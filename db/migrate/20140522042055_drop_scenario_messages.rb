class DropScenarioMessages < ActiveRecord::Migration
  def up
    create_table :scenario_messages do |t|
      t.belongs_to :scenario, index: true
      t.belongs_to :message, index: true

      t.timestamps
  end

  def down
    drop_table :scenario_messages
  end
end
