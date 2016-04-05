require 'rails_helper'

describe Organization do
  describe 'validations' do
    it 'validates the presence of pricing_policy' do
      organization = build(:organization, pricing_policy: nil)

      expect(organization).to be_invalid
    end

    it 'validates the presence of type' do
      organization = build(:organization, type: nil)

      expect(organization).to be_invalid
    end

    it 'validates the value of pricing_policy' do
      organization = build(:organization, pricing_policy: 'free')

      expect(organization).to be_invalid
    end

    it 'validates the value of type' do
      organization = build(:organization, type: 'Supermarket')

      expect(organization).to be_invalid
    end
  end
end
