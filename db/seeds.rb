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
    [ "tothlp", "tlplaszlo@gmail.com", "Mis3r3r3M3i", "true"],
    [ "bogizoli","bogaromi@msn.com", "zeuszka" , "true"]
]

users_list.each do |username, email, password, admin|
  User.create!( username: username, email: email, password: password, admin: admin)
end

Page.all.each do |page|
  page.destroy
end

Page.create!(id: 1, title: "Kezdőlap", body:"Hello Világ")

Setting.all.each do |setting|
  setting.destroy
end

settings=[
    ["title", "tothlp @ szte", "Az oldal címe"],
    ["header_title", "Tóth László", "Fejléc címe"],
    ["header_description", "Programtervező informatikus @ SZTE", "Fejléc leírása"],
    ["dateformat", "%Y.%m.%d", "Rövid dátumformátum"],
    ["dateformat_long", "%Y.%m.%d %H:%m", "Dátumformátum idővel"]
]

settings.each do |key, value, description|
  Setting.create!(key: key, value: value, description: description)
end

