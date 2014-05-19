class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :title
      t.boolean :is_enabled?

      t.timestamps
    end
  end
end
