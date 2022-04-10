Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  get "/sorted", to: "books#sorted", as: :sorted
  get "/sorted_by_author", to: "books#sorted_by_author", as: :author
  get "/total_price", to: "books#total_price", as: :total
  get "/save", to: "books#save_to_db", as: :save
end
