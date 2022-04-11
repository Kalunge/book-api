require 'rails_helper'

describe 'BooksApi', type: :request do
  describe 'GET BOOKS' do
    let!(:first_book) do
      FactoryBot.create(:book, publisher: 'U Ruby publishers', title: 'Eloquent Ruby: Secret behind becoming a Ruby Ninja',
                               author_first_name: 'Russ', author_last_name: 'Olsen', price: 52.99, container_title: 'On writing the most efficient Ruby code', publication_year: 2015)
    end
    let!(:second_book) do
      FactoryBot.create(:book, publisher: 'U Ruby publishers',
                               title: 'Eloquent Rails: Take your Rub on Rails skills to the next level', author_first_name: 'Jane', author_last_name: 'Doe', price: 45.99, container_title: 'On writing applications that Matter using Ruby on Rails', publication_year: 2010)
    end
    it 'Returns all books' do
      get '/books'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'id' => first_book.id,
                                                  'title' => first_book.title,
                                                  'author_first_name' => first_book.author_first_name,
                                                  'author_last_name' => first_book.author_last_name,
                                                  'publisher' => first_book.publisher,
                                                  'price' => first_book.price,
                                                  'container_title' => first_book.container_title,
                                                  'publication_year' => first_book.publication_year
                                                },
                                                {
                                                  'id' => second_book.id,
                                                  'title' => second_book.title,
                                                  'author_first_name' => second_book.author_first_name,
                                                  'author_last_name' => second_book.author_last_name,
                                                  'publisher' => second_book.publisher,
                                                  'price' => second_book.price,
                                                  'container_title' => second_book.container_title,
                                                  'publication_year' => second_book.publication_year
                                                }
                                              ])
    end
  end

  describe 'Get sorted books' do
    let!(:book_one) do
      FactoryBot.create(:book, publisher: 'U Js publishers',
                               title: 'Eloquent Javascript: Make Javascript your native language in no time', author_first_name: 'JOhn', author_last_name: 'Doe', price: 34.99, container_title: 'On writing Javascript like the Ninja you should be', publication_year: 2018)
    end
    let!(:book_two) do
      FactoryBot.create(:book, publisher: ' Clean code publishers',
                               title: 'THe clean Coder: Make your future self appreciate the code you write Today ', author_first_name: 'Robert', author_last_name: 'Mcchain', price: 62.99, container_title: 'code is not only written but read, make all those that read it happy', publication_year: 2007)
    end
    it 'returns books sorted Publisher, Author (last, first), then title' do
      get '/sorted'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'id' => book_two.id,
                                                  'title' => book_two.title,
                                                  'author_first_name' => book_two.author_first_name,
                                                  'author_last_name' => book_two.author_last_name,
                                                  'publisher' => book_two.publisher,
                                                  'price' => book_two.price,
                                                  'container_title' => book_two.container_title,
                                                  'publication_year' => book_two.publication_year
                                                },
                                                {
                                                  'id' => book_one.id,
                                                  'title' => book_one.title,
                                                  'author_first_name' => book_one.author_first_name,
                                                  'author_last_name' => book_one.author_last_name,
                                                  'publisher' => book_one.publisher,
                                                  'price' => book_one.price,
                                                  'container_title' => book_one.container_title,
                                                  'publication_year' => book_one.publication_year
                                                }

                                              ])
    end

    it 'Returns books sorted by Author (last, first) then title' do
      get '/sorted_by_author'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq([
                                                {
                                                  'id' => book_one.id,
                                                  'title' => book_one.title,
                                                  'author_first_name' => book_one.author_first_name,
                                                  'author_last_name' => book_one.author_last_name,
                                                  'publisher' => book_one.publisher,
                                                  'price' => book_one.price,
                                                  'container_title' => book_one.container_title,
                                                  'publication_year' => book_one.publication_year
                                                },
                                                {
                                                  'id' => book_two.id,
                                                  'title' => book_two.title,
                                                  'author_first_name' => book_two.author_first_name,
                                                  'author_last_name' => book_two.author_last_name,
                                                  'publisher' => book_two.publisher,
                                                  'price' => book_two.price,
                                                  'container_title' => book_two.container_title,
                                                  'publication_year' => book_two.publication_year
                                                }

                                              ])
    end
  end

  describe 'GET TOTAL' do
    let!(:book_three) do
      FactoryBot.create(:book, publisher: 'U Js publishers',
                               title: 'Eloquent Javascript: Make Javascript your native language in no time', author_first_name: 'JOhn', author_last_name: 'Doe', price: 34.6565599, container_title: 'On writing Javascript like the Ninja you should be', publication_year: 2018)
    end
    let!(:book_four) do
      FactoryBot.create(:book, publisher: ' Clean code publishers',
                               title: 'THe clean Coder: Make your future self appreciate the code you write Today ', author_first_name: 'Robert', author_last_name: 'Mcchain', price: 62.96559, container_title: 'code is not only written but read, make all those that read it happy', publication_year: 2007)
    end

    it 'Adds up the price column and rounds it off' do
      get '/total_price'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq((book_three.price + book_four.price).round(2))
    end
  end

  describe 'Saves a list from memory to Database' do
    books = [{
      publisher: 'U Java publishers', title: 'Eloquent Java: Secret behind becoming a Java Ninja', author_first_name: 'Russ', author_last_name: 'Olsen', price: 52.99, container_title: 'On writing the most efficient Ruby code', publication_year: 2013
    }, {
      publisher: 'U React publishers', title: 'Eloquent Rails: Take your Rub on Rails skills to the next level', author_first_name: 'Jane', author_last_name: 'Doe', price: 45.99, container_title: 'On writing applications that Matter using React on Rails', publication_year: 2012
    }, {
      publisher: 'U Js publishers', title: 'Eloquent Python: Make Python your native language in no time', author_first_name: 'JOhn', author_last_name: 'Doe', price: 34.99, container_title: 'On writing Python like the Ninja you should be', publication_year: 2005
    }, {
      publisher: ' Cleanest coder publishers', title: 'THe clean Coder: Make your future self appreciate the code you write Today ', author_first_name: 'Robert', author_last_name: 'Mcchain', price: 62.99, container_title: 'code is not only written but read, make all those that read it happy', publication_year: 2020
    }]

    it 'Saves books to memory' do
      get '/save'
      expect(response).to have_http_status(:success)
    end
  end
end
