class CreateOwnership < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :model_id
      t.integer :organization_id
    end
  end
end
