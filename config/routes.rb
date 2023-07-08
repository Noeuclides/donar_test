Rails.application.routes.draw do
  namespace :campaign, path: '/' do
    get 'donaton', to: 'donaton#index'
  end

  namespace :form do
    post 'payment_method/validate'
    post 'donation_amount/validate'
    post 'donor_info/validate'
  end
  resources :donations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
