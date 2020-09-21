Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/flights', to: 'flights#index'

  get '/airlines/:id', to: 'airlines#show'

  get "/passengers", to: "passengers#index"

  delete "/flightpassengers/:id", to: "flightpassengers#destroy"


end
