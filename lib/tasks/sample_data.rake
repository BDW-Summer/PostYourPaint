namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(email: "erik@example.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    60.times do |n|
      email = "example-#{n+1}@example.org"
      password  = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    10.times do 
        color_family = "Reds"
        name = "Royal Red"
        hex = "FF0022"
        location = 80304
        quantity = 2
        additional_info = "Yeah this is some legit paint. You should hop on this before it gets snatched up"
        users.each { |user| user.paints.create!(color_family: color_family, name: name, hex: hex, location: location, quantity: quantity, additional_info: additional_info) }
    end
  end
end