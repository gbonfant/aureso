class ModelsController < ApplicationController

  def model_types
    models = Model.where(model_slug: params['model_slug'])

    render json: models
  end
end
