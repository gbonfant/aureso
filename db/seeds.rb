ActiveRecord::Base.transaction do
  audi_a5 = Model.create(name: 'Audi A5', model_slug: 'audi_a5')
  audi_a8 = Model.create(name: 'Audi A8', model_slug: 'audi_a8')

  ModelType.create(name: 'Coupe', model_type_slug: 'coupe_8t3', base_price: 100, model: audi_a5)

  ModelType.create(name: 'S8 FSI quattro', model_type_slug: 's8_quattro', base_price: 300, model: audi_a8)

  Organization.create(
    name: 'Marina Bay Show Room',
    kind: 'Show room',
    pricing_policy: 'prestige',
    models: [audi_a5, audi_a8]
  )
end
