Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :my_portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'my_portfolios/:id', to: 'my_portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  #get 'design-news', to: 'hcd_news'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => ',cable'

  root to: 'pages#home'

end
