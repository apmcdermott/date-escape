FactoryGirl.define do
  factory :message do
    trigger { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
  end

  factory :scenario do
    title { 'Faker::Lorem.word' }
    is_enabled? { true }
  end
end
