Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#dashboard'

  resources :projects, except: [:index] do
    resources :deliverables do
      resources :image_attachments
    end
  end










end
