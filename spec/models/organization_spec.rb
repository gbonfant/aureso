require 'rails_helper'

describe Organization do
  it 'has many models' do
    bmw_z3 = Model.create(name: 'BMW Z3', model_slug: 'bmw_z3')
    bmw_m1 = Model.create(name: 'BMW M1', model_slug: 'bmw_m1')
    organization = Organization.create(kind: 'Dealer', pricing_policy: 'prestige', models: [bmw_z3, bmw_m1])

    expect(organization.models).to include(bmw_z3, bmw_m1)
  end

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
