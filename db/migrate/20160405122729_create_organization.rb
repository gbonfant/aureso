class CreateOrganization < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :public_name
      t.string :type
      t.string :pricing_policy
    end
  end
end
