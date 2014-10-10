Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#dashboard'
  match '/project/info', to: 'projects#info', via: 'get'
  match '/project/inspiration', to: 'projects#inspiration', via: 'get'


  resources :projects, except: [:index] do
    resources :deliverables
    resources :image_attachments
    resources :video_attachments
  end










end
