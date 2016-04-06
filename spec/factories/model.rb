FactoryGirl.define do
  factory :model do
    name 'Series 1'
    model_slug 'serie_1'

    factory :model_with_model_types do
      after(:create) do |model, evaluator|
        create(:model_type, name: 'BMW 116i', model: model, base_price: 200, model_type_slug: '116i')
        create(:model_type, name: 'BMW 125i', model: model, base_price: 250, model_type_slug: '125i')
      end
    end
  end
end
