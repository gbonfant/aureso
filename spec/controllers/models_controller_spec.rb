require 'rails_helper'

describe ModelsController do
  describe 'GET models/:model_slug/model_types' do
    it 'returns a successful response' do
      get :model_types, { model_slug: 'foocar' }

      expect(response).to be_success
    end

    it 'returns a list of models and models types' do
      Model.create(name: 'serie1', model_slug: 'foocar')
      Model.create(name: 'serie2', model_slug: 'foocar')

      get :model_types, { model_slug: 'foocar' }

      res = JSON.parse(response.body, symbolize_names: true)

      expect(res).to eq({
        models: [
          { name: 'serie1' },
          { name: 'serie2' }
        ]
      })
    end

    it 'returns a total_price for each model type'
  end
end
