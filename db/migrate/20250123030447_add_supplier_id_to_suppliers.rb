class AddSupplierIdToSuppliers < ActiveRecord::Migration[7.2]
  def change
    add_column :suppliers, :supplier_id, :integer
  end
end
