Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root 'static_pages#dashboard'
  match '/project/info', to: 'projects#info', via: 'get'
  match '/project/inspiration', to: 'projects#inspiration', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'


  resources :projects, except: [:index] do
    member do
      get 'deliverables_plan'
    end
    resources :collaborators
    resources :notes
    resources :deliverables
    resources :image_attachments
    resources :video_attachments
  end










end
