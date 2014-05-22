# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Message.delete_all
puts 'Creating Messages'
m1 = Message.create!(trigger: 'figmergency', content: 'The cat is vomiting all over the living room. Please advise.', voice: 'woman', language: 'en')
m2 = Message.create!(trigger: 'mom is mad', content: 'We need to talk.', voice: 'woman', language: 'en')
m3 = Message.create!(trigger: 'dad is sad', content: 'I need to talk to you right now.', voice: 'man', language: 'en')
m4 = Message.create!(trigger: 'meow', content: 'Meow meow, meow meow meow.', voice: 'man', language: 'en')

User.delete_all
puts 'Creating Users'
joe = User.create!(email: 'joe@example.com', password: 'password', phone: '+12154297996')
mandy = User.create!(email: 'mandy@example.com', password: 'password', phone: '+16176508085')

puts 'Linking Data'
joe.messages << m1
joe.messages << m4
mandy.messages << m3
mandy.messages << m2
