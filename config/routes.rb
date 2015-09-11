Rails.application.routes.draw do

  resources :secret_santas, only: [:index, :new, :create]

end
