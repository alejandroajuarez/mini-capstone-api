class RenameNameToSupplierName < ActiveRecord::Migration[7.2]
  def change
    rename_column :suppliers, :name, :supplier_name
  end
end
