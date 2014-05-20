class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.string :trigger
      t.text :content
      t.string :voice, default: 'alice'
      t.string :language, default: 'en-US'
      t.timestamps
    end
  end
end
