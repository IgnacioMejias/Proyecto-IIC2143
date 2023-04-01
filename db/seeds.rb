# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'user', email: 'user@base.com', password: '123456', password_confirmation: '123456', role: 'user').save
User.create(name: 'moderator', email: 'moderator@base.com', password: '123456', password_confirmation: '123456', role: 'moderator').save
User.create(name: 'admin', email: 'admin@base.com', password: '123456', password_confirmation: '123456', role: 'admin', admin: true).save