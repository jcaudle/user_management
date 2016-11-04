# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Thing.count == 0
  Thing.create(name: "Something")
  puts "Created Something!"
end

User.create(email: 'someone@example.com', password: 'password', password_confirmation: 'password') unless User.find_by email: 'someone@example.com'
puts "someone@example.com is configured."

reader = User.find_by(email: 'reader@example.com') || User.create(email: 'reader@example.com', password: 'password', password_confirmation: 'password')
reader.abilities = :read_things
reader.save
puts "reader@example.com is configured."

creator = User.find_by(email: 'creator@example.com') || User.create(email: 'creator@example.com', password: 'password', password_confirmation: 'password')
creator.abilities = :create_things
creator.save
puts "creator@example.com is configured."

editor = User.find_by(email: 'editor@example.com') || User.create(email: 'editor@example.com', password: 'password', password_confirmation: 'password')
editor.abilities = :modify_things
editor.save
puts "editor@example.com is configured."

destroyer = User.find_by(email: 'destroyer@example.com') || User.create(email: 'destroyer@example.com', password: 'password', password_confirmation: 'password')
destroyer.abilities = :destroy_things
destroyer.save
puts "destroyer@example.com is configured."

admin = User.find_by(email: 'admin@example.com') || User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
admin.abilities = :modify_users
admin.save
puts "admin@example.com is configured."
