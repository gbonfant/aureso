class PricingPolicy
  attr_reader :base_price

  def initialize(base_price: 0)
    @base_price = base_price
  end

  def flexible
    flexible ||= base_price * MarginFetcher.flexible_margin
  end

  def fixed
    @fixed ||= base_price + MarginFetcher.fixed_margin
  end

  def prestige
    @prestige ||= base_price + MarginFetcher.prestige_margin
  end
end
