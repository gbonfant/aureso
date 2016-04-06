class ModelsController < ApplicationController
  def model_types
    models = Model.where(model_slug: model_type_params[:model_slug])

    render json: models
  end

  def model_types_price
    model_type = ModelType.find_by(model_type_slug: model_price_params[:model_type_slug])
    model_type.update_attribute(:base_price, model_price_params[:base_price])

    render json: model_type, show_base_price: true
  end

  private

  def model_type_params
    params.permit(:model_slug)
  end

  def model_price_params
    params.permit(:model_slug, :model_type_slug, :base_price)
  end
end
