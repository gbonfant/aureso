require 'rails_helper'

describe Model do
  it 'has many organizations' do
    organization = Organization.create(kind: 'Dealer', pricing_policy: 'prestige')
    organization.models.create(name: 'BMW Z3', model_slug: 'bmw_z3')

    expect(Model.last.organizations).to include(organization)
  end
end
