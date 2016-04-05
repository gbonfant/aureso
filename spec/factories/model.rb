FactoryGirl.define do
  factory :model do
    name 'Car model'
    model_slug 'slug_name'

    factory :model_with_model_types do
      after(:create) do |model, evaluator|
        create(:model_type, name: 'bmw_116i', model: model)
        create(:model_type, name: 'bmw_125i', model: model)
      end
    end
  end
end
