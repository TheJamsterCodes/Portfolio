Rails.application.routes.draw do
  resources :my_portfolios, except: [:show]
  get 'my_portfolios/:id', to: 'my_portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'

end
