class Scenario < ActiveRecord::Base
  has_many :scenario_messages
  has_many :messages, through: :scenario_messages
end
