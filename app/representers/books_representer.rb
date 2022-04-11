class BooksRepresenter
  def initialize(books)
    @books = books
  end

  def as_json
    books.map do |book|
      {
        id: book.id,
        title: book.title,
        author_first_name: book.author_first_name,
        author_last_name: book.author_last_name,
        publisher: book.publisher,
        price: book.price,
        container_title: book.container_title,
        publication_year: book.publication_year
      }
    end
  end

  private

  attr_reader :books
end
