class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.belongs_to :user, index: true
      t.belongs_to :message, index: true

      t.timestamps
    end
  end
end
