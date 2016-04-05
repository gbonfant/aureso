class AddReferencesToModelTypes < ActiveRecord::Migration
  def change
    add_reference :model_types, :model, index: true, foreign_key: true
  end
end
