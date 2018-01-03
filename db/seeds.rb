require 'random_data'

user = User.create!(
	email: "aamarill.engr@gmail.com",
	password: "password",
	password_confirmation: "password",
	confirmed_at: Date.today,
)

5.times do
  application_name = RandomData.random_word
  url  = RandomData.random_url
  user.registered_applications.create({name: application_name, url: url})
end

events = ['visit', 'click', 'sign-up', 'sign-in']

30.times do
  registered_application_index = Random.rand(5)
  event_index = Random.rand(4)
  event_name  = events[event_index]
  user.registered_applications[registered_application_index].events.create({name: event_name})
end

puts "#{User.count} users have been created"
puts "#{RegisteredApplication.count} registred applications have been created"
puts "#{Event.count} events have been created"
