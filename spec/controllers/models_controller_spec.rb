require 'rails_helper'

describe ModelsController do
  describe 'GET models/:model_slug/model_types' do
    it 'returns a list of models and models types' do
      get 'foo_car/model_types'

      expect(response).to be_success
    end

    it 'returns a total_price for each model type'
  end
end
