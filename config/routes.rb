Rails.application.routes.draw do
  # get "/companies", to: "companies#index"
  # post "/companies", to: "companies#create"
  # get "/companies/:id", to: "companies#show"
  # patch "/companies/:id", to: "companies#update"
  # delete "/companies/:id", to: "companies#destroy"

  resources :companies, except: %i[new edit] do
    resources :critics, except: %i[new edit]
  end

  resources :games, except: %i[new edit] do
    resources :critics, except: %i[new edit]
  end

  resources :users, except: %i[new edit]

  post "/games/:id/add_genre", to: "games#add_genre"
  delete "/games/:id/remove_genre", to: "games#remove_genre"
end
