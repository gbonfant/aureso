class Organization < ActiveRecord::Base
  validates :type, presence: true, inclusion: { in: ['Show room', 'Service', 'Dealer'] }
  validates :pricing_policy, presence: true, inclusion: { in: %w(flexible fixed prestige) }
end
