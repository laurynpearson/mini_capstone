# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new(name: "Fresh Laundry", price: 3, image_url: "https://images-na.ssl-images-amazon.com/images/I/31oiNKI4GTL._SX355_.jpg", description: "Have the scent of fresh laundry around all the time!")
product.save