class Organization < ActiveRecord::Base
  has_many :ownerships
  has_many :models, through: :ownerships

  validates :kind, presence: true, inclusion: { in: ['Show room', 'Service', 'Dealer'] }
  validates :pricing_policy, presence: true, inclusion: { in: %w(flexible fixed prestige) }
end
