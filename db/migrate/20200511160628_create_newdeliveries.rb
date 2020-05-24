class CreateNewdeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :newdeliveries do |t|
      t.string :delivery_id
      t.string :source
      t.string :destination
      t.string :type
      t.string :booked_by
      t.string :address
      t.string :city
      t.string :state
      t.integer :pincode
      t.integer :phone_no
      t.string :delivery_address
      t.integer :contact_no
      t.timestamps
    end
  end
end
