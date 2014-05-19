class ScenarioMessage < ActiveRecord::Base
  belongs_to :scenario
  belongs_to :message
end

