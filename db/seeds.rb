# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = Book.create!([{
  publisher: "U Ruby publishers", title: "Eloquent Ruby: Secret behind becoming a Ruby Ninja", author_first_name:"Russ", author_last_name: "Olsen", price: 52.99, container_title: "On writing the most efficient Ruby code", publication_year: 2015
},{
  publisher: "U Ruby publishers", title: "Eloquent Rails: Take your Rub on Rails skills to the next level", author_first_name:"Jane", author_last_name: "Doe", price: 45.99, container_title: "On writing applications that Matter using Ruby on Rails", publication_year: 2010
}, {
  publisher: "U Js publishers", title: "Eloquent Javascript: Make Javascript your native language in no time", author_first_name:"JOhn", author_last_name: "Doe", price: 34.99, container_title: "On writing Javascript like the Ninja you should be", publication_year: 2018
}, {
  publisher: " Clean code publishers", title: "THe clean Coder: Make your future self appreciate the code you write Today ", author_first_name:"Robert", author_last_name: "Mcchain", price: 62.99, container_title: "code is not only written but read, make all those that read it happy", publication_year: 2007
}])
