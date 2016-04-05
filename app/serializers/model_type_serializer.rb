class ModelTypeSerializer < ActiveModel::Serializer
  attributes :name, :total_price

  def total_price
    0
  end
end
