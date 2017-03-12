# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.each do |user|
  user.destroy
end

users_list = [
    [ "tlplaszlo@gmail.com", "Mis3r3r3M3i" ],
    [ "bogaromi@msn.com", "zeuszka" ]
]

users_list.each do |email, password|
  User.create!( email: email, password: password )
end

Page.all.each do |page|
  page.destroy
end
Page.create!(id: 1, title: "Kezdőlap", body:"Hello Világ")