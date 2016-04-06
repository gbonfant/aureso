class ModelType < ActiveRecord::Base
  belongs_to :model

  def total_price
    PricingPolicy.new(base_price: base_price).send(model.organizations.first.pricing_policy)
  end
end
