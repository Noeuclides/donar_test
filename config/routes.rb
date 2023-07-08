Rails.application.routes.draw do
  namespace :campaign, path: '/' do
    get 'donaton', to: 'donaton#index'
  end

  namespace :form do
    get 'payment_method/index'
    post 'payment_method/validate'
    get 'donation_amount/index'
    post 'donation_amount/validate'
    get 'donor_info/index'
    post 'donor_info/validate'
  end
  resources :donations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
