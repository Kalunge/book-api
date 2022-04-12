class BooksController < ApplicationController
  # /
  def index
    @books = Book.all
    render json: BooksRepresenter.new(@books).as_json
  end

  # /sorted
  def sorted
    @sorted_books = Book.all.order('publisher, author_last_name, author_first_name, title')
    render json: BooksRepresenter.new(@sorted_books).as_json
  end

  # /sorted_by_author
  def sorted_by_author
    @sorted_by_author_books = Book.all.order('author_last_name, author_first_name, title')
    render json: BooksRepresenter.new(@sorted_by_author_books).as_json
  end

  # /total_price
  def total_price
    @total = Book.all.sum(:price)
    render json: @total.round(2)
  end

 

  def create
    @books_to_save = [{
      publisher: 'U Java publishers', title: 'Eloquent Java: Secret behind becoming a Java Ninja', author_first_name: 'Russ', author_last_name: 'Olsen', price: 52.99, container_title: 'On writing the most efficient Ruby code', publication_year: 2013
    }, {
      publisher: 'U React publishers', title: 'Eloquent Rails: Take your Rub on Rails skills to the next level', author_first_name: 'Jane', author_last_name: 'Doe', price: 45.99, container_title: 'On writing applications that Matter using React on Rails', publication_year: 2012
    }, {
      publisher: 'U Js publishers', title: 'Eloquent Python: Make Python your native language in no time', author_first_name: 'JOhn', author_last_name: 'Doe', price: 34.99, container_title: 'On writing Python like the Ninja you should be', publication_year: 2005
    }, {
      publisher: ' Cleanest coder publishers', title: 'THe clean Coder: Make your future self appreciate the code you write Today ', author_first_name: 'Robert', author_last_name: 'Mcchain', price: 62.99, container_title: 'code is not only written but read, make all those that read it happy', publication_year: 2020
    }]

    Book.import(
      %i[publisher title author_first_name author_last_name price container_title publication_year],
      @books_to_save
    )

    @last_books = Book.last(@books_to_save.size)

    render json: BooksRepresenter.new(@last_books).as_json
  end

  # /procedure
  def sorted_db_procedure
    sorted_procedure = 'SELECT * FROM books ORDER BY publisher, author_last_name, author_first_name, title'
    @sorted_books = DbStoredProcedure.fetch_db_records(sorted_procedure)
    render json: @sorted_books
  end

  # /procedure/author
  def sorted_by_author_first_db_procedure
    sorted_by_author_procedure = 'SELECT * FROM books ORDER BY author_last_name, author_first_name, title'
    @sorted_by_author_first = DbStoredProcedure.fetch_db_records(sorted_by_author_procedure)
    render json: @sorted_by_author_first
  end

  # /:id
  def show
    @book = Book.find(params[:id])
    render json: BookRepresenter.new(@book).as_json
  end

  # /mla/:id
  def as_mla
    @book = Book.find(params[:id])
    render json: @book.output_mla
  end

  #  /chicago/:id
  def as_chicago
    @book = Book.find(params[:id])
    render json: @book.output_chicago_style
  end
end
