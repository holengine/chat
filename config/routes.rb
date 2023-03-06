Rails.application.routes.draw do
  root to: "rooms#index"

  devise_for :users

  resources :messages, only: :create do
    member {post :like}
  end

  resources :rooms, only: %i[show create destroy], param: :title
end
