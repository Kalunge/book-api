require 'rails_helper'

describe 'BooksApi', type: :request do
  describe 'GET BOOKS' do
    it 'Returns all books' do
      get '/api/v1/books'
      expect(response).to have_http_status(:success)
    end
  end
end
