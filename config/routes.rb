Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  get 'faq', to: 'pages#faq'
  get 'about', to: 'pages#about_us'
  get 'blog', to: 'pages#blog'
  get 'blog/:id', to: 'pages#post', as: :single_blog
  get 'tariffs', to: 'pages#tariffs'
  get 'testimonials', to: 'pages#testimonials'
  get 'offers', to: 'pages#offers'
  get 'contact', to: 'pages#contact'
  get 'user/dashboard', to: 'pages#dashboard'
  post 'tariffs/buy/:id', to: 'pages#buy_tariff', as: :buy_tariff
  post 'clients_questions', to: 'pages#clients_questions'

end
