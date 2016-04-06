class RenameOrganizationTypeToKind < ActiveRecord::Migration
  def change
    rename_column :organizations, :type, :kind
  end
end
