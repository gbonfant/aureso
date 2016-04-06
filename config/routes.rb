Rails.application.routes.draw do
  scope '/models' do
    get ':model_slug/model_types', to: 'models#model_types'
    post ':model_slup/model_types_price/:model_type_slug', to: 'models#model_types_price'
  end
end
