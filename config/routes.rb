Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :create do
    member {post :like}
  end
  resources :rooms, only: %i[show create], param: :title
  root to: "rooms#index"
end
