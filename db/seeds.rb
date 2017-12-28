require 'random_data'

user = User.create!(
	email: "aamarill.engr@gmail.com",
	password: "password",
	password_confirmation: "password",
	confirmed_at: Date.today,
)

registered_apps = []

5.times do
  name = RandomData.random_word;
  url  = RandomData.random_url;
  registered_apps << user.registered_applications.create({name: name, url: url})
end

puts "#{user.registered_applications.length} applications have been registered to #{user.email}"
