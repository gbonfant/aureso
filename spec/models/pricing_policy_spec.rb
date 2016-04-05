require 'rails_helper'

describe PricingPolicy do
  describe '#flexible' do
    it 'returns the total price based on a flexible margin' do
      allow(MarginFetcher).to receive(:flexible_margin) { 2 }

      total_price = described_class.new(base_price: 10).flexible

      expect(total_price).to eq(20)
    end
  end

  describe '#fixed' do
    it 'returns the total price based on a fixed margin' do
      allow(MarginFetcher).to receive(:fixed_margin) { 5 }

      total_price = described_class.new(base_price: 10).fixed

      expect(total_price).to eq(15)
    end
  end

  describe '#prestige' do
    it 'returns the total price based on a prestige margin' do
      allow(MarginFetcher).to receive(:prestige_margin) { 10 }

      total_price = described_class.new(base_price: 10).prestige

      expect(total_price).to eq(20)
    end
  end
end
