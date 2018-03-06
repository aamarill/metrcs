require 'random_data'

user = User.create!(
	email: "fake@example.com",
	password: "password",
	password_confirmation: "password",
	confirmed_at: Date.today
)

5.times do
  application_name = RandomData.random_word
  url  = "www.#{application_name}.com"
  user.registered_applications.create({name: application_name, url: url})
end

events = ['visit', 'click', 'sign-up', 'sign-in']

30.times do
  registered_application_index = Random.rand(5)
  event_index = Random.rand(4)
  event_name  = events[event_index]
  created_at = RandomData.random_date_after_year_2000
  user.registered_applications[registered_application_index].events.create({name: event_name, created_at: created_at})
end

puts "#{User.count} users have been created"
puts "#{RegisteredApplication.count} registred applications have been created"
puts "#{Event.count} events have been created"
