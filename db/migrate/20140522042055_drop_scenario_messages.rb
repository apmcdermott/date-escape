class DropScenarioMessages < ActiveRecord::Migration
  def up
    drop_table :scenario_messages
  end

  def down
    create_table :scenario_messages do |t|
      t.belongs_to :scenario, index: true
      t.belongs_to :message, index: true

      t.timestamps
    end
  end
end
