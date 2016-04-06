FactoryGirl.define do
  factory :model do
    name 'Series 1'
    model_slug 'series_1'

    factory :model_with_model_types do
      after(:create) do |model, evaluator|
        create(:model_type, name: 'bmw_116i', model: model, base_price: 200)
        create(:model_type, name: 'bmw_125i', model: model, base_price: 250)
      end
    end
  end
end
