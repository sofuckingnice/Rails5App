require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == 'admin' && password == 'qwerty'
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/async/tasks'

  devise_for :users
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
end
