class Message < ActiveRecord::Base
  validates :trigger, :content, presence: true
  has_many :scenario_messages
  has_many :scenarios, through: :scenario_messages
  belongs_to :user
end
