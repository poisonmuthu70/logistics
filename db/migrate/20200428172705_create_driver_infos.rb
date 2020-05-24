class CreateDriverInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :occupation
      t.string :phone_number
      t.string  :address
      t.string  :city
      t.string :state
      t.integer :pincode
      t.boolean :status, default: true
      t.boolean :is_verify, default: false
      t.boolean :is_available, default: true
      t.string :vechile_no
      t.string :vechile_type
      t.string :profile_path
      t.integer :delivery_count
      
      #t.references :address, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
