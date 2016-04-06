class Model < ActiveRecord::Base
  has_many :model_types
  has_many :ownerships
  has_many :organizations, through: :ownerships
end
