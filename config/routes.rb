Rails.application.routes.draw do
  
  devise_for :users
  root to: "furimas#index"
  resources :furimas , only: [:index, :new, :edit, :create, :destroy, :show, :update]do
   
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
