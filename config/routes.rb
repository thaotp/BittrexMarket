Rails.application.routes.draw do
    root to: "rails/welcome#index", as: :root
    get :ping, to: 'heroku#ping'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
