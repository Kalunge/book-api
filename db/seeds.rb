# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = Book.create!([{
  publisher: "Ruby publishers", title: "Eloquent Ruby", author_first_name:"Russ", author_last_name: "Olsen", price: 52.99
},{
  publisher: "Ruby publishers", title: "Eloquent Rails", author_first_name:"Jane", author_last_name: "Doe", price: 45.99
}, {
  publisher: "Js publishers", title: "Eloquent Javascript", author_first_name:"JOhn", author_last_name: "Doe", price: 34.99
}, {
  publisher: " Clean code publishers", title: "THe clean Coder ", author_first_name:"Robert", author_last_name: "Mcchain", price: 62.99
}])