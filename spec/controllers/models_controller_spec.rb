require 'rails_helper'

describe ModelsController do
  let(:base_params) do
    { model_slug: 'serie_1', auth_token: ENV['API_TOKEN'] }
  end

  before do
    create(:organization_with_models, pricing_policy: 'flexible')

    allow(MarginFetcher).to receive(:flexible_margin) { 20 }
  end

  describe 'GET models/:model_slug/model_types' do
    it 'returns a successful response' do
      get :model_types, base_params

      expect(response).to be_success
    end

    it 'returns a list of models and models types' do
      get :model_types, base_params

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to include(:models)
      expect(res[:models]).not_to be_empty
    end

    it 'returns the total_price for each model type' do
      get :model_types, base_params

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res[:models]).to eq([{
        name: 'Series 1', model_types: [
          { name: 'BMW 116i', total_price: 4000 }, { name: 'BMW 125i', total_price: 5000 }
        ]
      }])
    end
  end

  describe 'POST models/:model_slug/model_types_price/:model_type_slug' do
    it 'updates the base price for the given model type' do
      post :model_types_price, base_params.merge({ model_type_slug: '125i', base_price: 100 })

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to eq({ model_type: {
        name: 'BMW 125i', total_price: (100 * 20), base_price: 100
      }})
    end
  end
end
