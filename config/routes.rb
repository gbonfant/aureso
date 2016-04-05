Rails.application.routes.draw do
  resources :models, param: :model_slug, only: [] do
    get :model_types, on: :member
  end
end
