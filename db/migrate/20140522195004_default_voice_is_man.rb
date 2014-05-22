class DefaultVoiceIsMan < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      reversible do |dir|
        dir.up { t.change :voice, :string, default: 'man' }
        dir.down { t.change :voice, :string, default: 'alice' }
      end
    end
  end
end
