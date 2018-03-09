require 'random_data'
require 'faker'

user = User.create!(
	email: "fake@example.com",
	password: "password",
	password_confirmation: "password",
	confirmed_at: Date.today
)

5.times do
  domain    = Faker::ProgrammingLanguage.name
  last_name = Faker::Name.last_name
  url       = "http://#{domain}.com/#{last_name}"
  user.registered_applications.create({name: domain, url: url})
end

events = ['visit', 'ad-click', 'sign-in', 'purchase', 'sign-up']

200.times do
  registered_application_index = Random.rand(5)
  event_index = Random.rand(4)
  event_name  = events[event_index]
  # created_at = RandomData.random_date_after_year_2000
  created_at = rand(Date.new(2018,1,1)..Date.today)
  user.registered_applications[registered_application_index].events.create({name: event_name, created_at: created_at})
end

puts "#{User.count} users have been created"
puts "#{RegisteredApplication.count} registred applications have been created"
puts "#{Event.count} events have been created"
