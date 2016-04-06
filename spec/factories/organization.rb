FactoryGirl.define do
  factory :organization do
    name 'ACME Corp.'
    public_name 'ACME'
    kind 'Show room'
    pricing_policy 'flexible'

    factory :organization_with_models do
      after(:create) do |model, evaluator|
        model.models << FactoryGirl.create(:model_with_model_types)
      end
    end
  end
end
