# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create Initial Super user
Role.create(:name => "user")
Role.create(:name => "admin")

user = User.new(
  email: 'admin@test.com',
  password: 'beersadmin',
  password_confirmation: 'beersadmin',
  confirmed_at: Time.zone.now
)
user.add_role :admin
user.save

ability = Ability.new(user)
