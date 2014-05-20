class ScenarioMessagesBelongToUser < ActiveRecord::Migration
  def change
    change_table :scenario_messages do |t|
      t.belongs_to :user, index: true
    end
  end
end
