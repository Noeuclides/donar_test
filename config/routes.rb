Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    resources :donations
  end

  namespace :campaign, path: '/' do
    get 'donaton', to: 'donaton#index'
  end

  namespace :form do
    post 'payment_method/validate'
    post 'donation_amount/validate'
    post 'donor_info/validate'
  end
end
