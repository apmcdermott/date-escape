class Message < ActiveRecord::Base
  validates :trigger, :content, presence: true
  has_many :scenario_messages
  has_many :scenarios, through: :scenario_messages
  belongs_to :user
  accepts_nested_attributes_for :scenarios, :scenario_messages
end
