class DefaultLanguageIsEn < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      reversible do |dir|
        dir.up { t.change :language, :string, default: 'en' }
        dir.down { t.change :language, :string, default: 'en-US' }
      end
    end
  end
end
