class UserHasPhoneNumber < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :phone
      t.index :phone, unique: true
    end
  end
end
