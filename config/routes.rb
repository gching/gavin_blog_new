GavinBlogNew::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root 'chapters#index'
  resources :chapters, only: [:show]

  get '/feed' => 'chapters#feed', as: :feed, :defaults => { :format => 'atom' }

end
