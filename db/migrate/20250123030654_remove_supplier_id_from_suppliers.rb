class RemoveSupplierIdFromSuppliers < ActiveRecord::Migration[7.2]
  def change
    remove_column :suppliers, :supplier_id, :integer
  end
end
