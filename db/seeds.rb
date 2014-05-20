# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Scenario.delete_all
puts 'Creating Scenarios'
s1 = Scenario.create!(title: 'Bad date', is_enabled?: true)
s2 = Scenario.create!(title: 'Escape from family', is_enabled?: false)
s3 = Scenario.create!(title: 'Awkward person that I hate', is_enabled?: true)
s4 = Scenario.create!(title: 'I am a cat', is_enabled?: true)

Message.delete_all
puts 'Creating Messages'
m1 = Message.create!(trigger: 'figmergency', content: 'The cat is vomiting all over the living room. Please advise.', voice: 'woman', language: 'en')
m2 = Message.create!(trigger: 'mom is mad', content: 'We need to talk.', voice: 'woman', language: 'en')
m3 = Message.create!(trigger: 'dad is sad', content: 'Hey kiddo, I need to talk to you right now.', voice: 'man', language: 'en')
m4 = Message.create!(trigger: 'meow', content: 'Meow meow, meow meow meow.', voice: 'man', language: 'en')

User.delete_all
puts 'Creating Users'
joe = User.create!(email: 'joe@example.com', password: 'password')
mandy = User.create!(email: 'mandy@example.com', password: 'password')
fig = User.create!(email: 'fig@example.com', password: 'password')

puts 'Linking Data'
s1.messages << m1
s1.messages << m2
s2.messages << m2
s3.messages << m3
s4.messages << m4

joe.scenarios << s1
joe.scenarios << s2
joe.messages << m1
joe.messages << m2
mandy.scenarios << s3
mandy.messages << m3
fig.scenarios << s4
fig.messages << m4
