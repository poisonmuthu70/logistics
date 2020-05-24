class CreateCustomerInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_infos do |t|

      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.integer :pincode
      t.boolean :status, default: false
      t.boolean :is_verify, default: false
      t.string  :company_name
      #t.references :address, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
