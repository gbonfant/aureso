class ModelsController < ApplicationController
  def model_types
    models = Model.where(model_slug: params['model_slug'])

    render json: models
  end

  def model_types_price
    render json: :ok
  end
end
