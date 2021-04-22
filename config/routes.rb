Rails.application.routes.draw do

  root 'static_pages#home'
  get '/before_you_begin' => 'static_pages#before_you_begin'
  get '/application_checklist' => 'static_pages#application_checklist'
  get '/screening_questions' => 'static_pages#screening_questions'
  get '/exit_page' => 'static_pages#exit_page'

  resources :energy_applications

  # Users
  # Using Devise RegistrationsController for public user creation/registration.
  devise_for :users, controllers: { registrations: 'registrations' }
  # Using UsersController and /users/* paths for profile viewing and editing.
  resources :users, only: [:show, :edit, :update]
  # Namespacing to the '/admin/users' path, to avoid conflicting with Devise.
  scope 'admin' do
    resources :users, only: [:index, :new, :create, :destroy]
  end

  #allow uploading files to energy applications
  resources :energy_applications do
    member do
      get 'supporting_docs'
    end
  end


  namespace :admin do
    resources :energy_applications, except: [:new, :create, :edit] do
      get 'print', on: :member
      get 'export', on: :collection
    end
  end

end
