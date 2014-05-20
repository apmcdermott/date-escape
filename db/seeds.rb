# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Scenario.delete_all
puts 'Creating Scenarios'
Scenario.create!(title: 'My Scenario', is_enabled?: true)
Scenario.create!(title: 'Bad date', is_enabled?: true)
Scenario.create!(title: 'Escape from family', is_enabled?: false)
Scenario.create!(title: 'Long-ass meeting', is_enabled?: true)

Message.delete_all
puts 'Creating Messages'
Message.create!(trigger: 'emergency room', content: 'Hey, I need you to give me a ride to the E R.', voice: 'woman', language: 'en')
Message.create!(trigger: 'mom is sad', content: 'Honey, are you busy? I need to talk right now.', voice: 'woman', language: 'en')
Message.create!(trigger: 'dad is sad', content: 'Hey kiddo, are you busy? I need to talk to you right now.', voice: 'man', language: 'en')
Message.create!(trigger: 'portugese lady', content: 'Bom dia. Algum sem laticínios?', voice: 'alice', language: 'pt-BR')

User.delete_all
puts 'Creating Users'
joe = User.create!(email: 'joe@example.com', password: 'password')
mandy = User.create!(email: 'mandy@example.com', password: 'password')
fig = User.create!(email: 'fig@example.com', password: 'password')

# joe.message.create!(trigger: 'figgenmergency', content: "Fig has fallen and she can't get up!", voice: 'woman', language: 'en')
