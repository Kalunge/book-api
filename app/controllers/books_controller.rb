class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def sorted
    @sorted_books = Book.all.order('publisher, author_last_name, author_first_name, title')
    render json: @sorted_books
  end

  def sorted_by_author
    @sorted_by_author_books = Book.all.order('author_last_name, author_first_name, title')
    render json: @sorted_by_author_books
  end

  def total_price
    @total = Book.all.sum(:price)
    render json: @total.round(2)
  end

  def save_to_db
    @books_to_save = [{
      publisher: 'U Java publishers', title: 'Eloquent Java: Secret behind becoming a Java Ninja', author_first_name: 'Russ', author_last_name: 'Olsen', price: 52.99, container_title: 'On writing the most efficient Ruby code', publication_year: 2013
    }, {
      publisher: 'U React publishers', title: 'Eloquent Rails: Take your Rub on Rails skills to the next level', author_first_name: 'Jane', author_last_name: 'Doe', price: 45.99, container_title: 'On writing applications that Matter using React on Rails', publication_year: 2012
    }, {
      publisher: 'U Js publishers', title: 'Eloquent Python: Make Python your native language in no time', author_first_name: 'JOhn', author_last_name: 'Doe', price: 34.99, container_title: 'On writing Python like the Ninja you should be', publication_year:2005
    }, {
      publisher: ' Cleanest coder publishers', title: 'THe clean Coder: Make your future self appreciate the code you write Today ', author_first_name: 'Robert', author_last_name: 'Mcchain', price: 62.99, container_title: 'code is not only written but read, make all those that read it happy', publication_year: 2020
    }]

    Book.import(@books_to_save)
  end

  def sorted_db_procedure
    @sorted_books = DbStoredProcedure.fetch_db_records('SELECT * FROM books ORDER BY publisher, author_last_name, author_first_name, title')
    render json: @sorted_books
  end

  def sorted_by_author_first_db_procedure
    @sorted_by_author_first = DbStoredProcedure.fetch_db_records('SELECT * FROM books ORDER BY author_last_name, author_first_name, title')
    render json: @sorted_by_author_first
  end

  def show
    @book = Book.find(params[:id])
    render json: @book.output_chicago_style
  end
end
