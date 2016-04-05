require 'rails_helper'

describe ModelsController do
  describe 'GET models/:model_slug/model_types' do
    it 'returns a successful response' do
      get :model_types, { model_slug: 'foobar' }

      expect(response).to be_success
    end

    it 'returns a list of models and models types' do
      create(:model_with_model_types, name: 'serie_1', model_slug: 'foobar')
      get(:model_types, { model_slug: 'foobar' })

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to include(:models)
      expect(res[:models]).not_to be_empty
    end

    it 'returns the total_price for each model type'
  end
end
