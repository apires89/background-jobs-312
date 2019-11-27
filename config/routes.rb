Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
