Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :navtoolhws
    resources :navtooldevices
    resources :navtoolsws do
      get 'make', on: :collection
      get 'model', on: :collection
      get 'sw', on: :collection
    end

    get 'ftpload' => 'navtoolsws#ftpload'
  end
end
