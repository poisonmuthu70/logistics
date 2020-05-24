class AddEmailToCustomerInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :customer_infos, :vechile_no, :string
    add_column :customer_infos, :vechile_type, :string
    add_column :customer_infos, :meterial, :string
  end
end
