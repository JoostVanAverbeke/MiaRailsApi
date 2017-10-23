Rails.application.routes.draw do 
  get 'users', to: 'users#index', defaults: { format: :json }
  
  resources :employees, only: [:index, :show], defaults: { format: :json } do
    resources :job_times, only: [:index]  do
      get 'streams', action: :streams, on: :collection
    end
  end
  resources :projects, only: [:index, :show], defaults: { format: :json } do
    resources :job_times, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
