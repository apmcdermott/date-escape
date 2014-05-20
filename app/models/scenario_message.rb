class ScenarioMessage < ActiveRecord::Base
  belongs_to :scenario
  belongs_to :message
  belongs_to :user
end

