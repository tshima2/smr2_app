Rails.application.routes.draw do
  get 'sites', to: 'sites#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sites do
    collection do
      post :confirm
    end
  end

end
