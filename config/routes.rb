Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :labelconfigs
    resources :navtoolhws
    resources :navtoolbtls
    resources :navtooldevices
    resources :navtoolsws do
      get 'make', on: :collection
      get 'model', on: :collection
      get 'sw', on: :collection
    end

    get 'ftpload' => 'navtoolsws#ftpload'
    get 'obdupdate' => 'navtooldevices#obdupdate'
    get 'registerdevice' => 'navtooldevices#registerdevice'
  end
  get 'bc_make' => 'bcdropdownsearchs#bc_make'
  get 'bc_model' => 'bcdropdownsearchs#bc_model'
  get 'bc_years' => 'bcdropdownsearchs#bc_years'
  get 'bc_options' => 'bcdropdownsearchs#bc_options'
end
