class ModelTypeSerializer < ActiveModel::Serializer
  attributes :name, :total_price
  attribute :base_price, if: :show_base_price?

  def show_base_price?
    instance_options.fetch(:show_base_price, false)
  end
end
