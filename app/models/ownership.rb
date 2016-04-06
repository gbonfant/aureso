class Ownership < ActiveRecord::Base
  belongs_to :model
  belongs_to :organization
end
