Rails.application.routes.draw do

  root 'static_pages#home'
  get "before_you_begin" => "static_pages#before_you_begin"
  get "application_main_info" => "static_pages#application_main_info"
  get "application_checklist" => "static_pages#application_checklist"
  get "energy_applications" => "energy_applications#index"

  # Users
  # Using Devise RegistrationsController for public user creation/registration.
  devise_for :users, controllers: { registrations: 'registrations' }
  # Using UsersController and /users/* paths for profile viewing and editing.
  resources :users, only: [:show, :edit, :update]
  # Namespacing to the '/admin/users' path, to avoid conflicting with Devise.
  scope 'admin' do
    resources :users, only: [:index, :new, :create, :destroy]
  end

end
