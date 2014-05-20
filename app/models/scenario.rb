class Scenario < ActiveRecord::Base
  validates :title, presence: true
  has_many :scenario_messages
  has_many :messages, through: :scenario_messages
  belongs_to :user
  accepts_nested_attributes_for :messages, :scenario_messages
end
