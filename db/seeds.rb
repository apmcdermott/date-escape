# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Scenario.delete_all
puts 'Creating Scenarios'
2.times do |i|
  Scenario.create!(title: Faker::Lorem.words(rand(1..3)).join(' '), is_enabled?: true)
end

Message.delete_all
puts 'Creating Messages'
5.times do |i|
  Message.create!(trigger: Faker::Lorem.word, content: Faker::Lorem.sentence)
end

User.delete_all
puts 'Creating Users'
joe = User.create!(email: 'joe@example.com', password: 'password')
mandy = User.create!(email: 'mandy@example.com', password: 'password')
fig = User.create!(email: 'fig@example.com', password: 'password')

3.times do |i|
  joe.messages.create!(trigger: "joe_message_#{i}", content: Faker::Lorem.sentence)
end

2.times do |i|
  mandy.messages.create!(trigger: "mandy_message_#{i}", content: Faker::Lorem.sentence)
end

2.times do |i|
  fig.messages.create!(trigger: "fig_message_#{i}", content: Faker::Lorem.sentence)
end

