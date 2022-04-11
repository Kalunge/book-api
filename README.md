

## Getting Started

- Make sure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [Postgresql](https://www.postgresql.org/download/) installed on your system.

  
- Install rails by running `gem install rails`

- Clone this repository by running `git clone git@github.com:Kalunge/book-api.git` in your command line.

- Navigate to the repository by running `cd book-api`.

- update `database.yml` with your postgres database credentials

- Run `bundle install` to install all dependencies

- Run `rails db:create`, `rails db:migrate`, and `rails db:seed`   to create, migrate and seed your database.
  
- you can run `rails db:reset` to perform the above scripts at once

- run `rails s` to fire up your server



PostGres database, table design along with fields and their datatypes.
![drawSQL-export-2022-04-11_12_23](https://user-images.githubusercontent.com/50773868/162736001-e9bd3429-0fc7-4983-a848-6fa75374f050.png)

- Use your favourite API testing tool(Postman, terminal, Thunder client in vscode) to test the endpoints as follows

### Books
<details>
  <summary>
    <b>Get Books</b> - <i>returns list all bible books</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/books`
  <br /><br />

  ```
  [
  {
    "id": 1,
    "title": "Eloquent Ruby: Secret behind becoming a Ruby Ninja",
    "author_first_name": "Russ",
    "author_last_name": "Olsen",
    "publisher": "U Ruby publishers",
    "price": 52.99,
    "container_title": "On writing the most efficient Ruby code",
    "publication_year": 2015
  },
  {
    "id": 2,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U Ruby publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using Ruby on Rails",
    "publication_year": 2010
  },

    ...
  ]
  ```
</details>

<details>
  <summary>
    <b>Get sorted</b> - <i>returns list sorted by Publisher, Author (last, first), then title</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/sorted`
  <br /><br />

  ```
  [
  {
    "id": 4,
    "title": "THe clean Coder: Make your future self appreciate the code you write Today ",
    "author_first_name": "Robert",
    "author_last_name": "Mcchain",
    "publisher": " Clean code publishers",
    "price": 62.99,
    "container_title": "code is not only written but read, make all those that read it happy",
    "publication_year": 2007
  },
  {
    "id": 16,
    "title": "THe clean Coder: Make your future self appreciate the code you write Today ",
    "author_first_name": "Robert",
    "author_last_name": "Mcchain",
    "publisher": " Cleanest coder publishers",
    "price": 62.99,
    "container_title": "code is not only written but read, make all those that read it happy",
    "publication_year": 2020
  },

    ...
  ]
  ```
</details>


<details>
  <summary>
    <b>Get sorted_by_author</b> - <i>returns list sorted by Author (last, first) then title</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/sorted_by_author`
  <br /><br />

  ```
  [
 {
    "id": 6,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },
  {
    "id": 14,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },

    ...
  ]
  ```
</details>


  <details>
  <summary>
    <b>Get /procedure</b> - <i>returns list sorted by Publisher, Author (last, first), then title using stored procedure</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/procedure`
  <br /><br />

  ```
  [
   {
    "id": 4,
    "publisher": " Clean code publishers",
    "title": "THe clean Coder: Make your future self appreciate the code you write Today ",
    "author_last_name": "Mcchain",
    "author_first_name": "Robert",
    "price": 62.99,
    "created_at": "2022-04-11T09:02:31.005Z",
    "updated_at": "2022-04-11T09:02:31.005Z",
    "container_title": "code is not only written but read, make all those that read it happy",
    "publication_year": 2007
  },
  {
    "id": 16,
    "publisher": " Cleanest coder publishers",
    "title": "THe clean Coder: Make your future self appreciate the code you write Today ",
    "author_last_name": "Mcchain",
    "author_first_name": "Robert",
    "price": 62.99,
    "created_at": "2022-04-11T11:11:36.691Z",
    "updated_at": "2022-04-11T11:11:36.691Z",
    "container_title": "code is not only written but read, make all those that read it happy",
    "publication_year": 2020
  },
    ...
  ]
  ```
</details>

<details>
  <summary>
    <b>Get /procedure/author</b> - <i>returns list sorted by Author (last, first) then title using stored procedure</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/procedure/author`
  <br /><br />

  ```
  [
 {
    "id": 6,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },
  {
    "id": 14,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },

    ...
  ]
  ```
</details>

 <details>
  <summary>
    <b>Get total_price</b> - <i> return the total price of all books in the database</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/total_price`
  <br /><br />

  ```
  787.84
  ```
</details>

<details>
  <summary>
    <b>Get sorted_by_author</b> - <i>returns list sorted by Author (last, first) then title</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/sorted_by_author`
  <br /><br />

  ```
  [
 {
    "id": 6,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },
  {
    "id": 14,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },

    ...
  ]
  ```
</details>

 <details>
  <summary>
    <b>Get save</b> - <i>  save the entire list to the database, with only one call to the DB server. and return saved records
</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/save`
  <br /><br />

  ```
[
  {
    "id": 17,
    "title": "Eloquent Java: Secret behind becoming a Java Ninja",
    "author_first_name": "Russ",
    "author_last_name": "Olsen",
    "publisher": "U Java publishers",
    "price": 52.99,
    "container_title": "On writing the most efficient Ruby code",
    "publication_year": 2013
  },
  {
    "id": 18,
    "title": "Eloquent Rails: Take your Rub on Rails skills to the next level",
    "author_first_name": "Jane",
    "author_last_name": "Doe",
    "publisher": "U React publishers",
    "price": 45.99,
    "container_title": "On writing applications that Matter using React on Rails",
    "publication_year": 2012
  },
  {
    "id": 19,
    "title": "Eloquent Python: Make Python your native language in no time",
    "author_first_name": "JOhn",
    "author_last_name": "Doe",
    "publisher": "U Js publishers",
    "price": 34.99,
    "container_title": "On writing Python like the Ninja you should be",
    "publication_year": 2005
  },
  {
    "id": 20,
    "title": "THe clean Coder: Make your future self appreciate the code you write Today ",
    "author_first_name": "Robert",
    "author_last_name": "Mcchain",
    "publisher": " Cleanest coder publishers",
    "price": 62.99,
    "container_title": "code is not only written but read, make all those that read it happy",
    "publication_year": 2020
  }
]
  ```
</details>

<details>
  <summary>
    <b>Get mla/:id</b> - <i>  outputs the MLA (Modern Language Association) style citation as a string of a given book
</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/mla/:id`
  <br /><br />

  ```
Olsen, Russ."Eloquent Ruby: Secret behind becoming a Ruby Ninja" On writing the most efficient Ruby code, U Ruby publishers,2015 pp. 120-126
  ```
</details>

<details>
  <summary>
    <b>Get /chicago/:id</b> - <i>  generate a Chicago style citation (Chicago Manual of Style) 
</i>
  </summary>
  <br/>
  
  <b>Endpoint:</b> `GET http://127.0.0.1:3000/chicago/:id`
  <br /><br />

  ```
Olsen, Russ. 2015 "Eloquent Ruby: Secret behind becoming a Ruby Ninja" On writing the most efficient Ruby code, no. 2(February 2000): 205-230. https://mybooks.org/344.55/8555
  ```
</details>

## Testing 
- run `rspec spec/`

## Built With

- Ruby On Rails
- Ruby Gems
- RSpec

## Version Control System

- Git

## Author

👤 **Titus Muthomi**

- GitHub: [@Kalunge](https://github.com/Kalunge)

- Twitter: [@titus_muthomi](https://twitter.com/titus_muthomi)

- LinkedIn: [Titus Muthomi](https://www.linkedin.com/in/muthomi-titus-295024181/)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Kalunge/book-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## License

This project is [MIT](LICENSE) licensed.
