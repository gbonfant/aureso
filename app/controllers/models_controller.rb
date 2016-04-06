class ModelsController < ApplicationController
  def model_types
    models = Model.where(model_slug: params['model_slug'])

    render json: models
  end

  def model_types_price
    model_type = ModelType.find_by(model_type_slug: params['model_type_slug'])
    model_type.update_attribute(:base_price, params[:base_price])

    render json: model_type, show_base_price: true
  end
end
