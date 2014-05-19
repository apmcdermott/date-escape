class CreateScenarioMessages < ActiveRecord::Migration
  def change
    create_table :scenario_messages do |t|
      t.belongs_to :scenario, index: true
      t.belongs_to :message, index: true

      t.timestamps
    end
  end
end
