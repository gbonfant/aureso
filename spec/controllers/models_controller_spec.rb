require 'rails_helper'

describe ModelsController do
  before do
    create(:organization_with_models, pricing_policy: 'flexible')

    allow(MarginFetcher).to receive(:flexible_margin) { 20 }
  end

  describe 'GET models/:model_slug/model_types' do
    it 'returns a successful response' do
      get :model_types, { model_slug: 'series_1' }

      expect(response).to be_success
    end

    it 'returns a list of models and models types' do
      get(:model_types, { model_slug: 'series_1' })

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to include(:models)
      expect(res[:models]).not_to be_empty
    end

    it 'returns the total_price for each model type' do
      get(:model_types, { model_slug: 'series_1' })

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res[:models]).to eq([{
        name: 'Series 1', model_types: [
          { name: 'bmw_116i', total_price: 4000 }, { name: 'bmw_125i', total_price: 5000 }
        ]
      }])
    end
  end
end
