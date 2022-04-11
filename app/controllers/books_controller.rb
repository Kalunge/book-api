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
      publisher: 'Crossway', title: 'Eloquent Ruby', author_first_name: 'Russ', author_last_name: 'Olsen', price: 52.99
    }, {
      publisher: 'Ruby publishers', title: 'Eloquent Rails', author_first_name: 'Jane', author_last_name: 'Doe', price: 45.99
    }, {
      publisher: 'Js publishers', title: 'Eloquent Javascript', author_first_name: 'JOhn', author_last_name: 'Doe', price: 34.99
    }, {
      publisher: ' Clean code publishers', title: 'THe clean Coder ', author_first_name: 'Robert', author_last_name: 'Mcchain', price: 62.99
    }]

    Book.import(@books_to_save)
  end

  def sorted_db_procedure
    @sorted_books = DbStoredProcedure.fetch_db_records("SELECT * FROM books ORDER BY publisher, author_last_name, author_first_name, title")
    render json: @sorted_books
  end

  def sorted_by_author_first_db_procedure
    @sorted_by_author_first = DbStoredProcedure.fetch_db_records("SELECT * FROM books ORDER BY author_last_name, author_first_name, title")
    render json: @sorted_by_author_first
  end
end
