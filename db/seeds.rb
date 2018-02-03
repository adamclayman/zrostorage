# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "5' x 10' Locker", description: "5'x10' storage unit. Seed #1", colour: "Unimportant", image_url: "/images/10x5.png", price: "55.00")
Product.create(name: "10' x 10' Locker", description: "10'x10' storage unit. Seed #2", colour: "Unimportant", image_url: "/images/10x10.png", price: "110.00")
Order.create(user_id: 1, product_id: 1, total: 10.0)
Order.create(user_id: 1, product_id: 2, total: 5.0)
user1 = User.create! :first_name => 'Adam', :last_name => 'Clayman', :email => 'adam@clayman.org', :password => 'Password', :password_confirmation => 'Password'
user2 = User.create! :first_name => 'Adam', :last_name => 'Clayman', :email => 'adc@clayman.org', :password => 'Password', :password_confirmation => 'Password'
Comment.create!(user: User.first, product: Product.first, rating: 1, body: "I hate the storage service I received.")
Comment.create!(user: User.second, product: Product.first, rating: 4, body: "I absolutely love this company. Sign me up for a decade!")
Comment.create!(user: User.second, product: Product.first, rating: 2, body: "I really liked the service. If I could improve anything, it would be the speed of delivery.")
Comment.create!(user: User.first, product: Product.first, rating: 1, body: "I hate the storage service I received.")
Comment.create!(user: User.second, product: Product.first, rating: 4, body: "I absolutely love this company. Sign me up for a decade!")
Comment.create!(user: User.second, product: Product.first, rating: 2, body: "I really liked the service. If I could improve anything, it would be the speed of delivery.")