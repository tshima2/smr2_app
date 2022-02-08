Rails.application.routes.draw do

devise_for :users
#  devise_for :users, controllers: {
#    sessions: 'users/sessions',
#    registrations: 'users/registrations',
#    passwords: 'users/passwords'
#  }
  resource :user

  get 'statics/top'
  root "statics#top"

  get 'sites', to: 'sites#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sites do
    collection do
      post :confirm
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
