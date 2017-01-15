Rails.application.routes.draw do
  
  resources :zombies do
  	resources :brains
  	get :decom, on: :member
  	put :custom_decomp, on: :member
  end

  get "/" => "zombies#index"

end
