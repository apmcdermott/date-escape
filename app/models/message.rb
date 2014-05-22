class Message < ActiveRecord::Base
  validates :trigger, :content, presence: true
  validates_uniqueness_of :trigger, scope: :user_id
  belongs_to :user

  VOICES = %w(man woman)
  LANGUAGES = %w(en en-gb es fr de it)
end
