class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.belongs_to :user
      t.string :title
      t.boolean :is_enabled?, default: true

      t.timestamps
    end
  end
end
