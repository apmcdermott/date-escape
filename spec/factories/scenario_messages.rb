# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scenario_message, :class => 'ScenarioMessage' do
    scenario nil
    message nil
  end
end
